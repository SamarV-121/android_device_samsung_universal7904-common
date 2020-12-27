/*
 * Copyright (C) 2016 The CyanogenMod Project
 * Copyright (C) 2020 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef SAMSUNG_POWER_H
#define SAMSUNG_POWER_H

/*
 * Board specific nodes
 *
 * If your kernel exposes these controls in another place, you can either
 * symlink to the locations given here, or override this header in your
 * device tree.
 */

static const std::vector<std::string> cpuSysfsPaths = {
    "/sys/devices/system/cpu/cpu0",
    "/sys/devices/system/cpu/cpu4"
};

static const std::vector<std::string> cpuInteractivePaths = {
    "/sys/devices/system/cpu/cpu0/cpufreq/interactive",
    "/sys/devices/system/cpu/cpu4/cpufreq/interactive"
};

/* interactive normal profile */
#define INTERACTIVE_NORMAL_L_HISPEED_FREQ "858000"
#define INTERACTIVE_NORMAL_L_GO_HISPEED_LOAD "85"
#define INTERACTIVE_NORMAL_L_TARGET_LOADS "75 1170000:85"
#define INTERACTIVE_NORMAL_L_ABOVE_HISPEED_DELAY "19000 1274000:39000"
#define INTERACTIVE_NORMAL_B_HISPEED_FREQ "1248000"
#define INTERACTIVE_NORMAL_B_GO_HISPEED_LOAD "89"
#define INTERACTIVE_NORMAL_B_TARGET_LOADS "80 1040000:81 1352000:87 1664000:90"
#define INTERACTIVE_NORMAL_B_ABOVE_HISPEED_DELAY "59000 1248000:79000 1664000:19000"

/* interactive power-save profile */
#define INTERACTIVE_LOW_L_HISPEED_FREQ "858000"
#define INTERACTIVE_LOW_L_GO_HISPEED_LOAD "85"
#define INTERACTIVE_LOW_L_TARGET_LOADS "75 1170000:85"
#define INTERACTIVE_LOW_L_ABOVE_HISPEED_DELAY "19000 1274000:39000"
#define INTERACTIVE_LOW_B_HISPEED_FREQ "1040000"
#define INTERACTIVE_LOW_B_GO_HISPEED_LOAD "99"
#define INTERACTIVE_LOW_B_TARGET_LOADS "87 1664000:90"
#define INTERACTIVE_LOW_B_ABOVE_HISPEED_DELAY "79000 1248000:99000 1664000:19000"

/* interactive high-performance profile */
#define INTERACTIVE_HIGH_L_HISPEED_FREQ "1274000"
#define INTERACTIVE_HIGH_L_GO_HISPEED_LOAD "75"
#define INTERACTIVE_HIGH_L_ABOVE_HISPEED_DELAY "19000"
#define INTERACTIVE_HIGH_L_TARGET_LOADS "60"
#define INTERACTIVE_HIGH_B_HISPEED_FREQ "1456000"
#define INTERACTIVE_HIGH_B_GO_HISPEED_LOAD "75"
#define INTERACTIVE_HIGH_B_TARGET_LOADS "70 1456000:80"
#define INTERACTIVE_HIGH_B_ABOVE_HISPEED_DELAY "19000"

#endif // SAMSUNG_POWER_H
