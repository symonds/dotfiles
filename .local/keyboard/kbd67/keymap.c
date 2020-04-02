#include QMK_KEYBOARD_H

#define RGB_RMO RGB_RMOD

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    /* Layer 0: Standard ISO layer */
    [0] = LAYOUT_65_iso( \
        KC_GESC, KC_1,    KC_2,    KC_3,     KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS, KC_EQL,           KC_BSPC, KC_HOME, \
        KC_TAB,  KC_Q,    KC_W,    KC_E,     KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC, KC_RBRC,                   KC_PGUP, \
        KC_CAPS, KC_A,    KC_S,    KC_D,     KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT, KC_NUHS,          KC_ENT,  KC_PGDN, \
        KC_LSFT, KC_NUBS, KC_Z,    KC_X,     KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT,          KC_UP,   KC_END,  \
        KC_LCTL, KC_LGUI, KC_LALT,                             KC_SPC,                             KC_LCTL, KC_RGUI, MO(1),   KC_LEFT, KC_DOWN, KC_RGHT  \
    ),
    /* Layer 1: Function layer */
    [1] = LAYOUT_65_iso( \
        KC_GRV,  KC_F1,   KC_F2,   KC_F3,    KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,           KC_DEL,  KC_SLCK, \
        _______, _______, BL_TOGG, RGB_TOG,  _______, _______, _______, RGB_HUI, RGB_HUD, _______, _______, KC_VOLD, KC_VOLU,                   _______, \
        _______, VLK_TOG, RGB_MOD, RGB_RMOD, _______, _______, _______, RGB_SAI, RGB_SAD, _______, _______, KC_MPRV, KC_MNXT,          RESET,   _______, \
        _______, _______, _______, RGB_SPI,  RGB_SPD, _______, _______, _______, RGB_VAI, RGB_VAD, _______, _______, KC_MPLY,          _______, KC_INS,  \
        _______, _______, _______,                             _______,                            _______, _______, _______, _______, _______, _______  \
    ),
};
