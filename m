From: Andrew Randrianasulu <randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Kill some nvc0 defines from nv50_ir_target_nv50.h
Date: Wed, 21 Oct 2020 21:20:24 +0300
Message-ID: <202010212120.25137.randrianasulu@gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_pvHkfksRZ1l/Ncf"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--Boundary-00=_pvHkfksRZ1l/Ncf
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Well, as Illia Mirkin suggested I killed few lines of code :}

Driver seems to compile fine afterwards, and run glxgeras :}
and clpeak too (but with external nv50 compute patches from Pierre Moreau)

=46rom 528143b24875e8053edfb95cfc97fe0ac7fa9ebb Mon Sep 17 00:00:00 2001
=46rom: Andrew Randrianasulu <randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Wed, 21 Oct 2020 21:14:24 +0300
Subject: [PATCH] Nuke NVC0 defines from nouveau/codegen/nv50_ir_target_nv50=
=2Eh
 (they are in nouveau/codegen/nv50_ir_target_nvc0.h)

=2D--
 src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h b/sr=
c/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h
index caf66b269db..604a35890b7 100644
=2D-- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h
@@ -24,12 +24,6 @@

 namespace nv50_ir {

=2D#define NVC0_BUILTIN_DIV_U32 0
=2D#define NVC0_BUILTIN_DIV_S32 1
=2D#define NVC0_BUILTIN_RCP_F64 2
=2D#define NVC0_BUILTIN_RSQ_F64 3
=2D
=2D#define NVC0_BUILTIN_COUNT 4

 class TargetNV50 : public Target
 {
=2D-
2.14.5

--Boundary-00=_pvHkfksRZ1l/Ncf
Content-Type: text/x-diff;
  charset="iso 8859-1";
  name="0001-Nuke-NVC0-defines-from-nouveau-codegen-nv50_ir_targe.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-Nuke-NVC0-defines-from-nouveau-codegen-nv50_ir_targe.patch"

=46rom 528143b24875e8053edfb95cfc97fe0ac7fa9ebb Mon Sep 17 00:00:00 2001
=46rom: Andrew Randrianasulu <randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Wed, 21 Oct 2020 21:14:24 +0300
Subject: [PATCH] Nuke NVC0 defines from nouveau/codegen/nv50_ir_target_nv50=
=2Eh
 (they are in nouveau/codegen/nv50_ir_target_nvc0.h)

=2D--
 src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h b/sr=
c/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h
index caf66b269db..604a35890b7 100644
=2D-- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.h
@@ -24,12 +24,6 @@
=20
 namespace nv50_ir {
=20
=2D#define NVC0_BUILTIN_DIV_U32 0
=2D#define NVC0_BUILTIN_DIV_S32 1
=2D#define NVC0_BUILTIN_RCP_F64 2
=2D#define NVC0_BUILTIN_RSQ_F64 3
=2D
=2D#define NVC0_BUILTIN_COUNT 4
=20
 class TargetNV50 : public Target
 {
=2D-=20
2.14.5


--Boundary-00=_pvHkfksRZ1l/Ncf
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--Boundary-00=_pvHkfksRZ1l/Ncf--
