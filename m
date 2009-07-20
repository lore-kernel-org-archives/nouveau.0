From: Peter Henriksson <peter.henriksson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch] Add shave support
Date: Tue, 21 Jul 2009 00:07:00 +0200
Message-ID: <1248127620.24062.5.camel@darwin.lan>
References: <1247502799.29492.3.camel@darwin.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-EiOjpQYhkIQNVz+fmp+2"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1247502799.29492.3.camel-/8qaU0siudx+urZeOPWqwQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--=-EiOjpQYhkIQNVz+fmp+2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-07-13 at 18:33 +0200, Peter Henriksson wrote:
> Patch to add shave support for cleaner output. Defaults to disabled.

I should have mentioned the patch was for the ddx.

It occurred to me that using the AM_SILENT_RULES functionality in
automake 1.11 might be a better solution.
Compared to the last patch this one defaults to quiet output. Override
with --disable-silent-rules or make V=1
Should still be compatible with earlier versions of automake.

Cheers,
Peter

--=-EiOjpQYhkIQNVz+fmp+2
Content-Disposition: attachment; filename="0001-Add-support-for-AM_SILENT_RULES.patch"
Content-Type: text/x-patch; name="0001-Add-support-for-AM_SILENT_RULES.patch"; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

From 15f657dd9f00bdd41dca09e2e2315c5260b604ad Mon Sep 17 00:00:00 2001
From: Peter Henriksson <peter.henriksson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Mon, 20 Jul 2009 23:56:13 +0200
Subject: [PATCH] Add support for AM_SILENT_RULES

Make use of the AM_SILENT_RULES functionality in automake 1.11
Defaults to quiet output. Verbose output can be enabled with
"./configure --disable-silent-rules" or "make V=1"
---
 configure.ac |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/configure.ac b/configure.ac
index 4e1d60a..ed41d9f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -45,6 +45,9 @@ AC_CONFIG_AUX_DIR(.)
 
 AM_INIT_AUTOMAKE([dist-bzip2])
 
+m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES])
+AM_SILENT_RULES([yes])
+
 # Checks for programs.
 AC_DISABLE_STATIC
 AC_PROG_LIBTOOL
-- 
1.6.3.3


--=-EiOjpQYhkIQNVz+fmp+2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-EiOjpQYhkIQNVz+fmp+2--
