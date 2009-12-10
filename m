From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Nouveau ctxprogs (Re: [git pull] drm)
Date: Thu, 10 Dec 2009 23:36:45 +0200
Message-ID: <20091210233645.679877a3@daedalus.pq.iki.fi>
References: <4B215B09.8050700@pathscale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B215B09.8050700-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "C. =?ISO-8859-1?Q?Bergstr=F6m?=" <cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 10 Dec 2009 15:33:13 -0500
"C. Bergstr=F6m" <cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org> wrote:

> Pekka Paalanen
> =

> > The big question is what we call ctxprogs: binary blobs that are
> > clearly executable, running somewhere in the GPU. No-one seems
> > to know, if those are copyrightable, or if they can be
> > redistributed. In their current form, they have been recorded
> > from the nvidia proprietary driver using mmiotrace, and copied
> > verbatim for each card type.
> =

> -------------------
> (apologies about the copy paste of thread, but I'm joining the
> list late)
> =

> Please see my other response.  From my perspective there is only =

> technical issues remaining and no license issues.  I am just
> evaluating and receiving information from one of the nouveau
> devs.  However, ctxprogs was obtained in the same way that the
> rest of the information was via dumping from the mmio-traces.
> (As stated above)

When Nouveau is able to generate ctxprogs itself, I completely
agree. But the current situation is a little different. We are
not collecting just the basic blocks individually like has
been done for everything else.  We are copying a complete program
or something that is a non-trivial composition. The proprietary
driver might be generating it on the fly from basic blocks, or
it might contain the complete programs. We only see the stream
of data going into the card. Apparently there is also freedom
to do things right more than one way(?), so it is not
trivial in the sense that the hardware would force it to be
exactly what we see.

How sure you are that there won't be a problem and that it is not
"actually copying a copyrighted work"?
Did you already see things the way I put it here?


Thanks.

-- =

Pekka Paalanen
http://www.iki.fi/pq/
