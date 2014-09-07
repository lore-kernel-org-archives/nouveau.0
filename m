From: Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: drm/nve0/disp: Fix HDMI InfoFrame initialisation.
Date: Sun, 7 Sep 2014 10:07:27 +0200
Message-ID: <20140907100727.5eb68199@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi.

(sorry for non-threaded reply, I expected to receive my own "git
send-email"-generated post)

This patch is an RFC, with at least 3 things to change before it could
be committed:
- commented-out NV84_DISP_SOR_HDMI_PWR_STATE_ON test: what is this
  needed for ? I couldn't find an equivalent in my trace, but maybe I
  just didn't do what is needed to generate these writes
- commented-out original 0x69040c write, just in case someone think
  it's better to use it (and if so, should I replace in other
  similar functions ?)
- maybe identifying the 0x690480 write

Regards,
-- 
Vincent Pelletier
