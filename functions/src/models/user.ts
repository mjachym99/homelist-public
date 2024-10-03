export type HomelistUser = {
    id: string,
    firstName: string,
    lastName: string,
    email: string,
    avatarImage?: string,
}

export type HomelistUserRequestBody = {
    firstName: string,
    lastName: string,
    email: string,
    password: string,
    avatarImage?: string,
}

export const usersCollectionKey = 'users'