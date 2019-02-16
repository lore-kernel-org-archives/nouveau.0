From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: drm/nouveau/bios/ramcfg, setting of RON pull value
Date: Sat, 16 Feb 2019 11:02:49 -0500
Message-ID: <CAKb7UvgYJEw5xBjkXtomJwbMHLcTK0fr8pxiMODJ49Vv=3EF-w@mail.gmail.com>
References: <2e3222ec-3355-b3d9-8409-5dcdc8b6de0c@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2e3222ec-3355-b3d9-8409-5dcdc8b6de0c@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Ian King <colin.king@canonical.com>
Cc: Roy Spliet <rspliet@eclipso.eu>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Sat, Feb 16, 2019 at 10:02 AM Colin Ian King
<colin.king@canonical.com> wrote:
>
> Hi,
>
> Static Analysis with CoverityScan as detected an issue with the setting
> of the RON pull value in function nvkm_gddr3_calc in
> drm/nouveau/bios/ramcfg.c
>
> This was introduced by commit: c25bf7b6155cb ("drm/nouveau/bios/ramcfg:
> Separate out RON pull value")
>
> CoverityScan reports the issue as follows:
>
>  84        case 0x20:
>  85                CWL = (ram->next->bios.timing[1] & 0x00000f80) >> 7;
>  86                CL  = (ram->next->bios.timing[1] & 0x0000001f) >> 0;
>  87                WR  = (ram->next->bios.timing[2] & 0x007f0000) >> 16;
>  88                /* XXX: Get these values from the VBIOS instead */
>  89                DLL = !(ram->mr[1] & 0x1);
>
>    CID 1324005 (#1 of 1): Operands don't affect result
> (CONSTANT_EXPRESSION_RESULT)
>
> result_independent_of_operands: !(ram->mr[1] & 768) >> 8 is 0 regardless
> of the values of its operands. This occurs as the operand of assignment.
>
>  90                RON = !(ram->mr[1] & 0x300) >> 8;
>  91                break;
>
> Looking at this, I believe perhaps the correct setting could be:
>
> RON = !((ram->mr[1] & 0x300) >> 8);
>
> ..however I don't have the datasheet available for the H/W so I'm not
> sure if this a correct fix.

Actually looking at the code a bit, I suspect it should just be

RON = (ram->mr[1] & 0x300) >> 8;

since later on, when we recompose the MR (memory register) value, we do:

        ram->mr[1] |= (RON & 0x03) << 8;

(And the whole point here is that we don't know how to get the proper
RON value for that timing table version, so we just copy whatever used
to be there in that case.)

  -ilia
