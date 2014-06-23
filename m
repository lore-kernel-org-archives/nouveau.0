From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH try 2 2/2] gallium/nouveau: move pushbuf and
 fences to context
Date: Mon, 23 Jun 2014 09:17:22 +0200
Message-ID: <53A7D482.70108@canonical.com>
References: <539FE12C.90900@canonical.com>	<539FE170.9040306@canonical.com>
 <CAKb7Uvjq0iKMM2sG0F+Q=BR6dftJUJL8qGnuV_CAVexYhW1DUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7Uvjq0iKMM2sG0F+Q=BR6dftJUJL8qGnuV_CAVexYhW1DUA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

op 21-06-14 14:12, Ilia Mirkin schreef:
> On Tue, Jun 17, 2014 at 2:34 AM, Maarten Lankhorst
> <maarten.lankhorst@canonical.com> wrote:
>> nv30 seems to not support dma objects with offset, so simply extend the query_heap to cover the
>> entire notifier, and use a offset in nv30_context_kick_notify.
> It would be great if you could detail the list of transformations that
> were done in the commit description, as well as what the "new way" is
> (if any) for the various concepts.
I moved the pushbuf and fences to each context separately. The PUSH_KICK on context switch ensures
that the previous context is flushed.
> This change doesn't have any of the locking -- is that coming in a
> future change? Otherwise we're still vulnerable to multiple threads
> trying to render at the same time. (Now with screen sharing, even if
> they end up with separate screens, we'd still be in trouble.)
I haven't done any locking changes, because I don't believe locking is the answer here.
With each context having its own pushbuf we can ensure that things aren't flushed, so
on flush it should assume all state is dirty. After this is done the PUSH_KICK of the old
context on context switch can be removed, and suddenly the driver is thread-safe because
only the pushbuf to kernel command submission could race. ;-)

> I'm still a bit concerned with moving the fence stuff to the
> context... there might be an assumption in gallium that fences are
> context-independent, in which case you need to make sure to have just
> a single fence shared by everything...
I don't think that this is the case, because it's very rare that gallium uses multiple contexts simultaneously.
(Except vdpau interop, which does flush explicitly.)
> Have you done a full piglit run on this (with the glx tests, for good
> measure) on nv30/nv50/nvc0? If so, can you share the results files
> somewhere?
No not yet. But I did confirm that glxgears and glxinfo didn't regress on my nv43, nv96 and nvc0. :-)

~Maarten
