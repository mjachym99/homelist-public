/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

// The Cloud Functions for Firebase SDK to create Cloud Functions and triggers.
// The Firebase Admin SDK to access Firestore.
import * as admin from "firebase-admin";
import { HttpsError, onCall } from "firebase-functions/v2/https";
import { FirebaseAuthError, UserRecord } from "firebase-admin/auth";
import { getFirestore } from "firebase-admin/firestore";
import { HomelistUser, HomelistUserRequestBody, usersCollectionKey } from "./models/user";

admin.initializeApp();

export const createFirestoreUserHttp = onCall(async (request) => {
  // Create document with the same ID as the auth UserRecord
  try{
    const body: HomelistUserRequestBody = request.data as HomelistUserRequestBody;
    const newUser: UserRecord = await admin.auth().createUser({
      displayName: `${body.firstName} ${body.lastName}`,
      email: body.email,
      password: body.password
    });

    const newFirestoreUser: HomelistUser = {
      id: newUser.uid,
      firstName: body.firstName,
      lastName: body.lastName,
      email: body.email,
      avatarImage: body.avatarImage,
    };
    await getFirestore().collection(usersCollectionKey).doc(newUser.uid).set(newFirestoreUser);
    return {message: "User Created Successfully"};
  } catch (error: any){
    if (error instanceof FirebaseAuthError){
      if(error.code == 'auth/email-already-exists'){
        throw new HttpsError("already-exists", error.message, error.code);
      }
      if(error.code == 'auth/invalid-password'){
        throw new HttpsError("invalid-argument", error.message, error.code);
      }
    }
    throw new HttpsError("unknown", error.message, error);
  }
});
