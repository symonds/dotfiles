#include QMK_KEYBOARD_H

const uint16_t keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    /* Layer 0: Default Layer */
    [0] = LAYOUT( \
        KC_ESC,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS, KC_EQL,  KC_NO,   KC_BSPC, KC_HOME, \
        KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC, KC_RBRC, KC_NO,            KC_PGUP, \
        KC_NLCK, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT, KC_NUHS, KC_ENT,           KC_PGDN, \
        KC_LSFT, KC_NUBS, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT, KC_UP,            KC_END,  \
        KC_LCTL, KC_LGUI, KC_LALT,                   KC_SPC,                             KC_RALT, KC_RGUI, MO(1),   KC_LEFT, KC_DOWN,          KC_RGHT  \
    ),
    /* Layer 1: Function layer */
    [1] = LAYOUT( \
        KC_GRV,  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  _______, KC_DEL, KC_SLCK, \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_VOLU, KC_MPRV, _______,         _______, \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_VOLD, KC_MNXT,   RESET,         _______, \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_MPLY,  BL_INC,         KC_INS,  \
        _______, _______, _______,                   _______,                            _______, _______, _______, BL_BRTG,  BL_DEC,         BL_TOGG  \
    ),
};
