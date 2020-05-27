import places from 'places.js';
const initAutocomplete = () => {
  const addressInput = document.getElementById('activity_location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

initAutocomplete();
