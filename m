From: "Renato Caldas" <seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: unable to compile xf86-video-nouveau
Date: Wed, 9 Jul 2008 11:33:40 +0100
Message-ID: <1caff7430807090333t571925c5wf0ea4cbef105bbff@mail.gmail.com>
References: <200807082243.12120.rjgleits@bellsouth.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_1930_15458511.1215599620989"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <200807082243.12120.rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org>
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

------=_Part_1930_15458511.1215599620989
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 9, 2008 at 3:43 AM, Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org> wrote:
> Greetings,
>
> After the modesetting commit, I have been unable to compile
> xf86-video-nouveau. The git site for drm given on the wiki page does not get
> the proper xf86drmMode.h, etc. I noted that libdrm git has over 100 branches
> and I really don't want to try all of them. Fedora 9 has a patch of the
> libdrm source rpm that includes an earlier version of xf86drmMode.h but it's
> now out of date. I would like to follow along in the development of nouveau
> as I have a GeForce 6800 GTO.
> Your kind help would be appreciated.

You're probably using a modesetting drm branch. The easy solution is
to switch to the plain drm branch.

If you really want to stick to the drm modesetting branch then you
AFAICT need git xorg, or some workarounds that make it compile for
non-git xorg.

Patch attached, but note that this is only a workaround. You can
commit it to your local nouveau repo and then git-rebase it after
git-fetching (I hope you know how to do that ;) .

Good luck,
  Renato Caldas

> Best Wishes,
>
> Bob Gleitsmann
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

------=_Part_1930_15458511.1215599620989
Content-Type: application/octet-stream;
 name=modesetting_for_nongit_xorg.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fifskb4j0
Content-Disposition: attachment; filename=modesetting_for_nongit_xorg.patch

Y29tbWl0IDVjZjA1MmViZjUxYTdmNmI3NDcxMTNkYmRiM2U5MjYzMDAwYTc3NmYKQXV0aG9yOiBS
ZW5hdG8gQ2FsZGFzIDxzZXZlbnRoZ3VhcmRpYW5AZ21haWwuY29tPgpEYXRlOiAgIFRodSBKdW4g
MjYgMTY6Mjc6MTAgMjAwOCArMDEwMAoKICAgIEZpeCBjb21waWxhdGlvbiBmb3IgbW9kZXNldHRp
bmcgZHJtIGFuZCBub24tZ2l0IHhvcmcKCmRpZmYgLS1naXQgYS9zcmMvZHJtbW9kZV9kaXNwbGF5
LmMgYi9zcmMvZHJtbW9kZV9kaXNwbGF5LmMKaW5kZXggMzgwN2EwNS4uYmMzYmY1ZiAxMDA2NDQK
LS0tIGEvc3JjL2RybW1vZGVfZGlzcGxheS5jCisrKyBiL3NyYy9kcm1tb2RlX2Rpc3BsYXkuYwpA
QCAtNDA0LDcgKzQwNCw3IEBAIGRybW1vZGVfZ2FtbWFfc2V0KHhmODZDcnRjUHRyIGNydGMsIENB
UkQxNiAqcmVkLCBDQVJEMTYgKmdyZWVuLCBDQVJEMTYgKmJsdWUsIGluCiAKIHN0YXRpYyBjb25z
dCB4Zjg2Q3J0Y0Z1bmNzUmVjIGRybW1vZGVfY3J0Y19mdW5jcyA9IHsKIAkuZHBtcyA9IGRybW1v
ZGVfY3J0Y19kcG1zLAotCS5zZXRfbW9kZV9tYWpvciA9IGRybW1vZGVfc2V0X21vZGVfbWFqb3Is
CisJLy8uc2V0X21vZGVfbWFqb3IgPSBkcm1tb2RlX3NldF9tb2RlX21ham9yLAogCS5zZXRfY3Vy
c29yX2NvbG9ycyA9IGRybW1vZGVfc2V0X2N1cnNvcl9jb2xvcnMsCiAJLnNldF9jdXJzb3JfcG9z
aXRpb24gPSBkcm1tb2RlX3NldF9jdXJzb3JfcG9zaXRpb24sCiAJLnNob3dfY3Vyc29yID0gZHJt
bW9kZV9zaG93X2N1cnNvciwK
------=_Part_1930_15458511.1215599620989
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

------=_Part_1930_15458511.1215599620989--
