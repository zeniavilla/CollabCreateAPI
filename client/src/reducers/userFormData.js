const initialState = {
  name: '',
  email: '',
  password: '',
  password_confirmation: ''
}

export const userFormData = (state = initialState, action) => {
  switch(action.type) {
    case 'UPDATED_USER_DATA':
      return action.userFormData

    default:
      return state;
  }
}