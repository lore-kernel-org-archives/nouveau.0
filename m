From: randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: PMC_BOOT_0 and nv4ref.h
Date: Fri, 17 Sep 2010 11:17:40 +0400
Message-ID: <201009171117.40774.randrianasulu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Id: nouveau.vger.kernel.org

looking at
http://www.ms.mff.cuni.cz/~havlj3am/src/nouveau/nvosdk-unscrambled/nv04/nv4ref.h

i found few "interesting" regs, not sure if current nouveau sets them correctly ?


from
nv4ref.h

/* Framebuffer registers */
#define NV_PFB                                0x00100FFF:0x00100000	/* RW--D */
#define NV_PFB_BOOT_0                                    0x00100000	/* RW-4R */
#define NV_PFB_BOOT_0_RAM_AMOUNT                                1:0	/* RW-VF */
#define NV_PFB_BOOT_0_RAM_AMOUNT_32MB                    0x00000000	/* RW--V */
#define NV_PFB_BOOT_0_RAM_AMOUNT_4MB                     0x00000001	/* RW--V */
#define NV_PFB_BOOT_0_RAM_AMOUNT_8MB                     0x00000002	/* RW--V */
#define NV_PFB_BOOT_0_RAM_AMOUNT_16MB                    0x00000003	/* RW--V */
#define NV_PFB_BOOT_0_RAM_WIDTH_128                             2:2	/* RW-VF */
#define NV_PFB_BOOT_0_RAM_WIDTH_128_OFF                  0x00000000	/* RW--V */
#define NV_PFB_BOOT_0_RAM_WIDTH_128_ON                   0x00000001	/* RW--V */
#define NV_PFB_BOOT_0_RAM_TYPE                                  4:3	/* RW-VF */
#define NV_PFB_BOOT_0_RAM_TYPE_256K                      0x00000000	/* RW--V */
#define NV_PFB_BOOT_0_RAM_TYPE_512K_2BANK                0x00000001	/* RW--V */
#define NV_PFB_BOOT_0_RAM_TYPE_512K_4BANK                0x00000002	/* RW--V */
#define NV_PFB_BOOT_0_RAM_TYPE_1024K_2BANK               0x00000003	/* RW--V */
#define NV_PFB_CONFIG_0                                  0x00100200	/* RW-4R */
#define NV_PFB_CONFIG_0_TYPE                                   14:0	/* RWIVF */
#define NV_PFB_CONFIG_0_TYPE_OLD1024_FIXED_8BPP          0x00000120	/* RW--V */
#define NV_PFB_CONFIG_0_TYPE_OLD1024_FIXED_16BPP         0x00000220	/* RW--V */
#define NV_PFB_CONFIG_0_TYPE_OLD1024_FIXED_32BPP         0x00000320	/* RW--V */
#define NV_PFB_CONFIG_0_TYPE_OLD1024_VAR_8BPP            0x00004120	/* RW--V */
#define NV_PFB_CONFIG_0_TYPE_OLD1024_VAR_16BPP           0x00004220	/* RW--V */
#define NV_PFB_CONFIG_0_TYPE_OLD1024_VAR_32BPP           0x00004320	/* RW--V */
#define NV_PFB_CONFIG_0_TYPE_TETRIS                      0x00002000	/* RW--V */
#define NV_PFB_CONFIG_0_TYPE_NOTILING                    0x00001114	/* RWI-V */
#define NV_PFB_CONFIG_0_TETRIS_MODE                           17:15	/* RWI-F */
#define NV_PFB_CONFIG_0_TETRIS_MODE_PASS                 0x00000000	/* RWI-V */
#define NV_PFB_CONFIG_0_TETRIS_MODE_1                    0x00000001	/* RW--V */
#define NV_PFB_CONFIG_0_TETRIS_MODE_2                    0x00000002	/* RW--V */
#define NV_PFB_CONFIG_0_TETRIS_MODE_3                    0x00000003	/* RW--V */
#define NV_PFB_CONFIG_0_TETRIS_MODE_4                    0x00000004	/* RW--V */
#define NV_PFB_CONFIG_0_TETRIS_MODE_5                    0x00000005	/* RW--V */
#define NV_PFB_CONFIG_0_TETRIS_MODE_6                    0x00000006	/* RW--V */
#define NV_PFB_CONFIG_0_TETRIS_MODE_7                    0x00000007	/* RW--V */
#define NV_PFB_CONFIG_0_TETRIS_SHIFT                          19:18	/* RWI-F */
#define NV_PFB_CONFIG_0_TETRIS_SHIFT_0                   0x00000000	/* RWI-V */
#define NV_PFB_CONFIG_0_TETRIS_SHIFT_1                   0x00000001	/* RW--V */
#define NV_PFB_CONFIG_0_TETRIS_SHIFT_2                   0x00000002	/* RW--V */
#define NV_PFB_CONFIG_0_BANK_SWAP                             22:20	/* RWI-F */
#define NV_PFB_CONFIG_0_BANK_SWAP_OFF                    0x00000000	/* RWI-V */
#define NV_PFB_CONFIG_0_BANK_SWAP_1M                     0x00000001	/* RW--V */
#define NV_PFB_CONFIG_0_BANK_SWAP_2M                     0x00000005	/* RW--V */
#define NV_PFB_CONFIG_0_BANK_SWAP_4M                     0x00000007	/* RW--V */
#define NV_PFB_CONFIG_0_UNUSED                                23:23	/* RW-VF */
#define NV_PFB_CONFIG_0_SCRAMBLE_EN                           29:29	/* RWIVF */
#define NV_PFB_CONFIG_0_SCRAMBLE_EN_INIT                 0x00000000	/* RW--V */
#define NV_PFB_CONFIG_0_SCRAMBLE_ACTIVE                  0x00000001	/* RW--V */
#define NV_PFB_CONFIG_0_PRAMIN_WR                             28:28	/* RWIVF */
#define NV_PFB_CONFIG_0_PRAMIN_WR_INIT                   0x00000000	/* RW--V */
#define NV_PFB_CONFIG_0_PRAMIN_WR_DISABLED               0x00000001	/* RW--V */
#define NV_PFB_CONFIG_0_PRAMIN_WR_MASK                        27:24	/* RWIVF */
#define NV_PFB_CONFIG_0_PRAMIN_WR_MASK_INIT              0x00000000	/* RWI-V */
#define NV_PFB_CONFIG_0_PRAMIN_WR_MASK_CLEAR             0x0000000f	/* RWI-V */
#define NV_PFB_CONFIG_1                                  0x00100204	/* RW-4R */
#define NV_PFB_RTL                                       0x00100300	/* RW-4R */
#define NV_PFB_RTL_H                                            0:0	/* RWIUF */
#define NV_PFB_RTL_H_DEFAULT                             0x00000000	/* RWI-V */
#define NV_PFB_RTL_MC                                           1:1	/* RWIUF */
#define NV_PFB_RTL_MC_DEFAULT                            0x00000000	/* RWI-V */
#define NV_PFB_RTL_V                                            2:2	/* RWIUF */
#define NV_PFB_RTL_V_DEFAULT                             0x00000000	/* RWI-V */
#define NV_PFB_RTL_G                                            3:3	/* RWIUF */
#define NV_PFB_RTL_G_DEFAULT                             0x00000000	/* RWI-V */
#define NV_PFB_RTL_GB                                           4:4	/* RWIUF */
#define NV_PFB_RTL_GB_DEFAULT                            0x00000000	/* RWI-V */
#define NV_PFB_CONFIG_0_RESOLUTION                              5:0	/* RWIVF */
#define NV_PFB_CONFIG_0_RESOLUTION_320_PIXELS            0x0000000a	/* RW--V */
#define NV_PFB_CONFIG_0_RESOLUTION_400_PIXELS            0x0000000d	/* RW--V */
#define NV_PFB_CONFIG_0_RESOLUTION_480_PIXELS            0x0000000f	/* RW--V */
#define NV_PFB_CONFIG_0_RESOLUTION_512_PIXELS            0x00000010	/* RW--V */
#define NV_PFB_CONFIG_0_RESOLUTION_640_PIXELS            0x00000014	/* RW--V */
#define NV_PFB_CONFIG_0_RESOLUTION_800_PIXELS            0x00000019	/* RW--V */
#define NV_PFB_CONFIG_0_RESOLUTION_960_PIXELS            0x0000001e	/* RW--V */
#define NV_PFB_CONFIG_0_RESOLUTION_1024_PIXELS           0x00000020	/* RW--V */
#define NV_PFB_CONFIG_0_RESOLUTION_1152_PIXELS           0x00000024	/* RW--V */
#define NV_PFB_CONFIG_0_RESOLUTION_1280_PIXELS           0x00000028	/* RW--V */
#define NV_PFB_CONFIG_0_RESOLUTION_1600_PIXELS           0x00000032	/* RW--V */
#define NV_PFB_CONFIG_0_RESOLUTION_DEFAULT               0x00000014	/* RWI-V */
#define NV_PFB_CONFIG_0_PIXEL_DEPTH                             9:8	/* RWIVF */
#define NV_PFB_CONFIG_0_PIXEL_DEPTH_8_BITS               0x00000001	/* RW--V */
#define NV_PFB_CONFIG_0_PIXEL_DEPTH_16_BITS              0x00000002	/* RW--V */
#define NV_PFB_CONFIG_0_PIXEL_DEPTH_32_BITS              0x00000003	/* RW--V */
#define NV_PFB_CONFIG_0_PIXEL_DEPTH_DEFAULT              0x00000001	/* RWI-V */
#define NV_PFB_CONFIG_0_TILING                                12:12	/* RWIVF */
#define NV_PFB_CONFIG_0_TILING_ENABLED                   0x00000000	/* RW--V */
#define NV_PFB_CONFIG_0_TILING_DISABLED                  0x00000001	/* RWI-V */
#define NV_PFB_CONFIG_1_SGRAM100                                3:3	/* RWIVF */
#define NV_PFB_CONFIG_1_SGRAM100_ENABLED                 0x00000000	/* RWI-V */
#define NV_PFB_CONFIG_1_SGRAM100_DISABLED                0x00000001	/* RW--V */
#define NV_PFB_DEBUG_0_CKE_ALWAYSON                           29:29	/* RWIVF */
#define NV_PFB_DEBUG_0_CKE_ALWAYSON_OFF                  0x00000000	/* RW--V */
#define NV_PFB_DEBUG_0_CKE_ALWAYSON_ON                   0x00000001	/* RWI-V */

my translation

define NV04_PFB_BOOT_0_RAM_WIDTH_128_enable = 1 << 2;
define NV04_PFB_CFG0_TYPE = 14:0
define NV04_PFB_CFG0_TYPE_OLD1024_FIXED_8BPP = 0x00000120;
define NV04_PFB_CFG0_TYPE_OLD1024_FIXED_16BPP = 0x00000220;
define NV04_PFB_CFG0_TYPE_OLD1024_FIXED_32BPP = 0x00000320;
define NV04_PFB_CFG0_TYPE_TETRIS = 0x00002000;
define NV04_PFB_CFG0_TYPE_NOTILING = 0x00001114;
define NV04_PFB_CFG0_TETRIS_MODE = 17:15
define NV04_PFB_CFG0_TETRIS_MODE_PASS                 0x00000000:
define NV04_PFB_CFG0_TETRIS_MODE_1 = 0x00000001;
.....
define NV04_PFB_CFG0_TETRIS_MODE_7 = 0x00000007;
define NV04_PFB_CFG0_TETRIS_SHIFT = 19:18
define NV04_PFB_CFG0_TETRIS_SHIFT_0                   0x00000000:
define NV04_PFB_CFG0_TETRIS_SHIFT_1                   0x00000001:
define NV04_PFB_CFG0_TETRIS_SHIFT_2                   0x00000002:
define NV04_PFB_CFG0_BANK_SWAP   =  22:20
define NV04_PFB_CFG0_SWAP_OFF            =        0x00000000;
define NV04_PFB_CFG0_SWAP_1M             =        0x00000001;
define NV04_PFB_CFG0_SWAP_2M             =        0x00000005;
define NV04_PFB_CFG0_SWAP_4M             =        0x00000007;
define NV04_PFB_CFG0_TILING =       12:12
define NV04_PFB_CFG0_TILING_ENABLED           =   0x00000000;
define NV04_PFB_CFG0_TILING_DISABLED         =    0x00000001;

define NV04_PFB_CFG1_SGRAM100 =  3:3
define NV04_PFB_CFG1_SGRAM100_ENABLED           =      0x00000000;
define NV04_PFB_CFG1_SGRAM100_DISABLED          =      0x00000001;
