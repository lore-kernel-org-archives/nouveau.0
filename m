From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] drm: Add separate state structure for
 legacy, non-KMS drivers
Date: Tue, 25 Feb 2020 17:37:23 +0000
Message-ID: <CACvgo52fCMEiohuOkXyZi_mVrFnhMmmB--W64AvhEgVe3i2T5A@mail.gmail.com>
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225155902.9751-2-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0107107675=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200225155902.9751-2-tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "daniel-/w4YWyX8dFk@public.gmane.org" <daniel-/w4YWyX8dFk@public.gmane.org>, "alexander.deucher-5C7GfCeVMHo@public.gmane.org" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, "sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org" <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, "emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org" <emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0107107675==
Content-Type: multipart/alternative; boundary="000000000000d80154059f69f093"

--000000000000d80154059f69f093
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tuesday, 25 February 2020, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org> wrote:

> Non-KMS drivers store state in struct drm_driver. This bloats the
> structure for KMS drivers and prevents it from being declared with
> 'static const' qualifiers. Moving the non-KMS state into a separate
> data structure resolves this.
>
>
Have you considered subclassing the const drm_driver for legacy drivers.
This way the legacy (pointer) data does not need to be exposed to
non-legacy drivers.

Not to mention that const data (drm_driver), which has (const) pointer to
mutable data (legacy bits) is a trap IMHO

Emil

--000000000000d80154059f69f093
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Thomas,</div><div><br></div>On Tuesday, 25 February 2020, Thomas Zi=
mmermann &lt;<a href=3D"mailto:tzimmermann-l3A5Bk7waGM@public.gmane.org">tzimmermann-l3A5Bk7waGM@public.gmane.org</a>=
&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Non-KMS drivers store state i=
n struct drm_driver. This bloats the<br>
structure for KMS drivers and prevents it from being declared with<br>
&#39;static const&#39; qualifiers. Moving the non-KMS state into a separate=
<br>
data structure resolves this.<br>
<br></blockquote><div><br></div><div>Have you considered subclassing the co=
nst drm_driver for legacy drivers. This way the legacy (pointer) data does =
not need to be exposed to non-legacy drivers.</div><div><br></div><div>Not =
to mention that const data (drm_driver), which has (const) pointer to mutab=
le data (legacy bits) is a trap IMHO</div><div><br></div><div>Emil</div>

--000000000000d80154059f69f093--

--===============0107107675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0107107675==--
