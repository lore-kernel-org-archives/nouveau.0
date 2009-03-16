From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Unknown DCB 1.4 / 1.5 entry, please report
Date: Mon, 16 Mar 2009 18:19:11 +0200
Message-ID: <20090316181911.24f1b57c@daedalus.pq.iki.fi>
References: <49BD3121.3020608@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <49BD3121.3020608-Mmb7MZpHnFY@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Ketzer <martin.ketzer-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 15 Mar 2009 17:47:29 +0100
Martin Ketzer <martin.ketzer-Mmb7MZpHnFY@public.gmane.org> wrote:

> Hallo,
> when i am trying to use nouveau i get the errors in the attached Xorg.log. I'm using debian
> unstable. Any suggestions?
> 

On a completely unrelated note, you want to fix the following, too:

[drm] failed to load kernel module "nouveau"
(EE) NOUVEAU(0): [dri] Failed to open the DRM
(EE) NOUVEAU(0): DRI pre-initialisation failed.  Setting NoAccel

I.e. make sure you have the DRM kernel modules built and they load.

This should not fix the DCB errors, but is otherwise essential.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
