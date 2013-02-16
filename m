From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Bugfix + dri1 cleanup patches
Date: Sat, 16 Feb 2013 20:48:40 +0000
Message-ID: <1361047727-740-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Had those patches living in my local tree for a while now.
Here is a respin on top of latest master

Patch 1: regression fix,  preventing the ddx from loading if kernel
module is not loaded

Patches 2-5: Completely nuke dri1, make dri2 hard dependency

Patches 6-7: Assist people with first-time build of nouveau

Git complains about whitespace errors in patch 7, which for the sake
of me I cannot see

--

[PATCH 1/7] nouveau: Check if the device supports modesetting, after
opening it

[PATCH 2/7] nouveau: stop using dri1 function DRICreatePCIBusID
[PATCH 3/7] nouveau: Do not load dri {sub,}module
[PATCH 4/7] dri1: purge the final references
[PATCH 5/7] nouveau: mandate dri2 build

[PATCH 6/7] configure: require xorg-macros 1.8
[PATCH 7/7] configure: printout the configuration info

--

 configure.ac       | 33 ++++++++++++++++++++++++++++++++-
 src/nouveau_dri2.c | 16 ++--------------
 src/nv_driver.c    | 46 +++++++++++++++++-----------------------------
 src/nv_type.h      |  8 --------
 4 files changed, 51 insertions(+), 52 deletions(-)
