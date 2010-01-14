From: Martin Wolters <sirdzstic-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Fwd: xf86-video-nouveau compile error and fix
Date: Thu, 14 Jan 2010 06:34:15 +0100
Message-ID: <4B4EACD7.6000606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello,

I found xf86-video-nouveau unable to compile on my system. Failing
with two errors in nv_accel_common.c about NV50_2D_CLIP_ENABLE and
NV50_2D_COLOR_KEY_ENABLE not being defined.

Comparing the source to xf86-video-nv, i found the missing constants
to be 0x290 for CLIP_ENABLE and 0x29c for COLOR_KEY_ENABLE. This got
nv_accel_common.c to compile.

I'd request these two constants to be defined to the said values
and this being committed to the git repository.

Regards,
Martin Wolters
