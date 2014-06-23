From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH try 2 2/2] gallium/nouveau: move pushbuf and
 fences to context
Date: Mon, 23 Jun 2014 17:57:23 +1000
Message-ID: <CACAvsv74rk1z68iF9Lhwouu1Ppub9dACbQUcGiGof=yChWPiuQ@mail.gmail.com>
References: <539FE12C.90900@canonical.com> <539FE170.9040306@canonical.com>
 <CAKb7Uvjq0iKMM2sG0F+Q=BR6dftJUJL8qGnuV_CAVexYhW1DUA@mail.gmail.com>
 <53A7D482.70108@canonical.com>
 <CACAvsv5EWy4hsMj5698OWKJraksf6a+nYFLTZQrjzB5uP3Jwww@mail.gmail.com>
 <53A7D997.9050507@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <53A7D997.9050507@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jun 23, 2014 at 5:39 PM, Maarten Lankhorst
<maarten.lankhorst@canonical.com> wrote:
> op 23-06-14 09:24, Ben Skeggs schreef:
>> On Mon, Jun 23, 2014 at 5:17 PM, Maarten Lankhorst
>> <maarten.lankhorst@canonical.com> wrote:
>>> op 21-06-14 14:12, Ilia Mirkin schreef:
>>>> On Tue, Jun 17, 2014 at 2:34 AM, Maarten Lankhorst
>>>> <maarten.lankhorst@canonical.com> wrote:
>>>>> nv30 seems to not support dma objects with offset, so simply extend the query_heap to cover the
>>>>> entire notifier, and use a offset in nv30_context_kick_notify.
>>>> It would be great if you could detail the list of transformations that
>>>> were done in the commit description, as well as what the "new way" is
>>>> (if any) for the various concepts.
>>> I moved the pushbuf and fences to each context separately. The PUSH_KICK on context switch ensures
>>> that the previous context is flushed.
>>>> This change doesn't have any of the locking -- is that coming in a
>>>> future change? Otherwise we're still vulnerable to multiple threads
>>>> trying to render at the same time. (Now with screen sharing, even if
>>>> they end up with separate screens, we'd still be in trouble.)
>>> I haven't done any locking changes, because I don't believe locking is the answer here.
>>> With each context having its own pushbuf we can ensure that things aren't flushed, so
>>> on flush it should assume all state is dirty. After this is done the PUSH_KICK of the old
>>> context on context switch can be removed, and suddenly the driver is thread-safe because
>>> only the pushbuf to kernel command submission could race. ;-)
>> It would be interesting to see some numbers on the impact of assuming
>> all state is lost each flush vs doing the locking.
> Using locking would mean only a single thread could do command submission at a time, so it still wouldn't be true multithreaded opengl.
> And there still seem to be some cases in which this isn't enough, for example the query stuff should probably become a dirty flag for validation.
Well, other threads are free to do everything else except the final
draw call still.  But yes, that's potentially a good chunk of the
work.  That can possibly be worked around in a couple of ways if the
numbers show it's worth bothering.

>
> ~Maarten
