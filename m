From: Colin Ian King <colin.king@canonical.com>
Subject: drm/nouveau/bios/ramcfg, setting of RON pull value
Date: Sat, 16 Feb 2019 14:59:54 +0000
Message-ID: <2e3222ec-3355-b3d9-8409-5dcdc8b6de0c@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roy Spliet <rspliet@eclipso.eu>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Hi,

Static Analysis with CoverityScan as detected an issue with the setting
of the RON pull value in function nvkm_gddr3_calc in
drm/nouveau/bios/ramcfg.c

This was introduced by commit: c25bf7b6155cb ("drm/nouveau/bios/ramcfg:
Separate out RON pull value")

CoverityScan reports the issue as follows:

 84        case 0x20:
 85                CWL = (ram->next->bios.timing[1] & 0x00000f80) >> 7;
 86                CL  = (ram->next->bios.timing[1] & 0x0000001f) >> 0;
 87                WR  = (ram->next->bios.timing[2] & 0x007f0000) >> 16;
 88                /* XXX: Get these values from the VBIOS instead */
 89                DLL = !(ram->mr[1] & 0x1);

   CID 1324005 (#1 of 1): Operands don't affect result
(CONSTANT_EXPRESSION_RESULT)

result_independent_of_operands: !(ram->mr[1] & 768) >> 8 is 0 regardless
of the values of its operands. This occurs as the operand of assignment.

 90                RON = !(ram->mr[1] & 0x300) >> 8;
 91                break;

Looking at this, I believe perhaps the correct setting could be:

RON = !((ram->mr[1] & 0x300) >> 8);

..however I don't have the datasheet available for the H/W so I'm not
sure if this a correct fix.

Colin
