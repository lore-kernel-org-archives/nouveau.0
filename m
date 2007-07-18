From: Stephan Schmid <stephan_2303-S0/GAf8tV78@public.gmane.org>
Subject: [patch] bios command length
Date: Wed, 18 Jul 2007 14:14:57 +0200
Message-ID: <469E0441.3030109@web.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070003090309060407070506"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------070003090309060407070506
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
this ddx patch adds command length, offset and mult for the bios commands with ids
0x8f to 0x92.
It avoids the 10000x"Init table command not found:" error messages for those bios commands.

Greetings
Stephan Schmid


--------------070003090309060407070506
Content-Type: text/plain;
 name="bios_only.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="bios_only.diff"

diff --git a/src/nv_bios.c b/src/nv_bios.c
index 286e85f..aca34c8 100644
--- a/src/nv_bios.c
+++ b/src/nv_bios.c
@@ -1292,10 +1292,10 @@ static init_tbl_entry_t itbl_entry[] = {
 	{ "INIT_INDEX_IO"                     , 0x78, 6       , 0       , 0       , init_index_io                   },
 /*	{ "INIT_PLL2"                         , 0x79, x       , x       , x       , init_pll2                       }, */
 	{ "INIT_ZM_REG"                       , 0x7A, 9       , 0       , 0       , init_zm_reg                     },
-/*	{ "INIT_RAM_RESTRICT_ZM_REG_GROUP"    , 0x8F, x       , x       , x       , init_ram_restrict_zm_reg_group  }, */
-/*	{ "INIT_COPY_ZM_REG"                  , 0x90, x       , x       , x       , init_copy_zm_reg                }, */
-/*	{ "INIT_ZM_REG_GROUP_ADDRESS_LATCHED" , 0x91, x       , x       , x       , init_zm_reg_group_addr_latched  }, */
-/*	{ "INIT_RESERVED"                     , 0x92, x       , x       , x       , init_reserved                   }, */
+	{ "INIT_RAM_RESTRICT_ZM_REG_GROUP"    , 0x8F, 7       , 6       , 32       , /*init_ram_restrict_zm_reg_group*/ NULL  }, 
+	{ "INIT_COPY_ZM_REG"                  , 0x90, 3       , 2       , 3       , /*init_copy_zm_reg*/                },
+	{ "INIT_ZM_REG_GROUP_ADDRESS_LATCHED" , 0x91, 6       , 5       , 4       , /*init_zm_reg_group_addr_latched*/ NULL  },
+	{ "INIT_RESERVED"                     , 0x92, 1       , 0       , 0       , /*init_reserved*/         NULL          }, 
 	{ 0                                   , 0   , 0       , 0       , 0       , 0                               }
 };
 

--------------070003090309060407070506
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------070003090309060407070506--
