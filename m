From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Getting reviews for nouveau contributions in igt?
Date: Thu, 02 Jul 2020 14:16:11 -0400
Message-ID: <5fcb1490dd12b0e2da3fbb34e5431ab3ce162839.camel@redhat.com>
Reply-To: lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: IGT development <igt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi! I haven't had much luck asking around in IRC, so I figured this would be the
next place to start. As many of you know I've been working on getting nouveau
into good shape with igt-gpu-tools, now that we've finally finished implementing
CRC support thannks to nvidia's help. I should note that the patches for this
have been accepted into nouveau, Ben's just working on rebasing them on top of
some of the display refactoring + other stuff he's been working on. So they
should appear in drm-tip in the near future, but they're still available on
patchwork for anyone who wants to try them:

   https://patchwork.freedesktop.org/series/78803/
(also needs https://patchwork.freedesktop.org/series/78915/ )

ANYWAY-the first question I had was whether anyone on here would be willing to
help me with getting acks and/or reviews for some of the nouveau-related igt
patches I've sent upstream? One of the patch series adds some nouveau-specific
CRC tests:

   https://patchwork.freedesktop.org/series/74811/

The others add some missing bits to some basic kms tests that I noticed while
doing CRC bringup:

   https://patchwork.freedesktop.org/series/74806/ - fixes false-positives in
   kms_plane plane-position-hole tests

   https://patchwork.freedesktop.org/series/74808/ - adds a test to
   kms_pipe_crc_basic to exercise disabling CRC capture on a pipe immediately
   after said pipe being disabled.

The second question that I had is in the future, for adding nouveau-specific
tests is it acceptable for me to just get reviews from other nouveau developers
or should I be trying to pull people in from this mailing list from outside the
project?
