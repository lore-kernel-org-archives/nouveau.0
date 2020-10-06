From: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v2 0/3] Documentation: nouveau: Introduce some
 nouveau documentation
Date: Tue,  6 Oct 2020 17:13:10 -0400
Message-ID: <20201006211313.49177-1-jcline@redhat.com>
References: <20200911162128.405604-1-jcline@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200911162128.405604-1-jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi folks,

Here's a v2 of the initial nouveau documentation page.

Based on Roy Spliet's feedback, I added a pointer to envytools
documentation, and attempted to clarify that this document is only about
software architecture.

I also noted more clearly it was meant to compliment the nouveau
freedesktop.org documentation.

Finally, for some starter documentation I dropped my vague placeholder
documentation on the display engine struct and added notes on the CRC
work, which I recently became more familiar with.

I've left out sub-sections for which I had no content, but you can
imagine the nouveau-specific ioctls being documented in their own
sub-section of the "Public API" section, or additional sub-sections to the
"Private APIs" for NVKM and such.

Let me know what you think!

Jeremy Cline (3):
  drm/nouveau/kms/nvd9-: Introduce some kernel-docs for CRC support
  nouveau: Add kernel-docs for module parameters
  Documentation: nouveau: Introduce some nouveau documentation

 Documentation/gpu/drivers.rst          |   1 +
 Documentation/gpu/nouveau.rst          | 173 +++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/crc.c |   8 ++
 drivers/gpu/drm/nouveau/dispnv50/crc.h |  65 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_drm.c  | 162 +++++++++++++++++++++++
 5 files changed, 409 insertions(+)
 create mode 100644 Documentation/gpu/nouveau.rst

-- 
2.28.0
