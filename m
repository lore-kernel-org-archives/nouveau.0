From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Why was old TTM removed from drm.git?
Date: Wed, 24 Jun 2009 21:04:52 +0300
Message-ID: <20090624210452.2ab34b0e@daedalus.pq.iki.fi>
References: <20090624194306.0730cb2f@daedalus.pq.iki.fi>
	<4A4261D1.8070204@shipmail.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A4261D1.8070204-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, dri-devel-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 24 Jun 2009 19:26:41 +0200
Thomas Hellstr=F6m <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org> wrote:

> Hi, Pekka!
> =

> I'm sorry for this breakage. I thought drm master was currently used =

> only for libdrm development, but
> I see now that I didn't pay enough attention. Just prior to the commit I =

> sent out a message explaining what I was going to do and why, but =

> apparently it didn't make it to the list (which seems to be the case of =

> quite a few mails these days).

Yeah, I read dri-devel@ daily, and I didn't notice anything. Of course
I could have missed it.

> Please feel free to revert that commit and pull it in again when you =

> think it's OK, or perhaps anchor a nouveau drm branch just ahead of this =

> commit. The old TTM is completely unmaintained and blocks any attempt to =

> bring the drm.git master repo reasonably up to sync with what's in the =

> kernel, so the sooner it goes away the better.
> =

> Again, Sorry for the breakage.

Don't worry, I believe we can live with this for the few days it takes
to get our replacement source going.

Bringing drm.git up to sync... are you saying someone is going to
start porting stuff from Linus' tree back to drm.git?
Isn't drm.git linux-core dying after all?


Thanks.

-- =

Pekka Paalanen
http://www.iki.fi/pq/
