From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: FPS limiter implementation in driver
Date: Mon, 3 Sep 2007 19:24:54 +0300
Message-ID: <20070903192454.48ccadaf@daedalus.pq.iki.fi>
References: <000601c7ee0c$d0b24230$0901a8c0@775DualVSTA>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <000601c7ee0c$d0b24230$0901a8c0@775DualVSTA>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Manuel Signoret <manuel.signoret-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 3 Sep 2007 11:28:40 +0200
"Manuel Signoret" <manuel.signoret-39ZsbGIQGT5GWvitb5QawA@public.gmane.org> wrote:

> I dream about a FPS limiter included directly in my NVidia GC.
> Because I think that a non-marketing attitude should be to use a FPS
> of 30-35 in the majority of the 3D-games.
> 
> In order to economize energy, heat production and improve system
> stability. And also to fight a few against some stupid marketing
> excesses.

Isn't Sync to Vertical Blank enough? That should rate limit it to
screen refresh rate. Or would you really want to go lower than refresh
rate?

With flat panels you can in theory go very low in refresh rate. I have
not experimented with it myself, but I do not know of any reason why
e.g. 30 Hz refresh rate would not be possible. Unless frequency
generators cannot be adjusted that low...
Of course with CRT this is impossible due to flicker.
Might also require custom modelines.

-- 
Pekka "PQ" Paalanen
http://www.iki.fi/pq/
