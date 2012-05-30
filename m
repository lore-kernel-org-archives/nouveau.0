From: Arvydas Sidorenko <asido4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: still seeking way to recover card after cursor
 disappears or card locks up
Date: Wed, 30 May 2012 13:24:55 +0200
Message-ID: <CA+6av4mpPKsPHh5RF0Ddzkg7eA=BWQH-sq9K9UPEyKtEnoN8zw@mail.gmail.com>
References: <20120530042532.B56B023446@one.localnet>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120530042532.B56B023446-QrSMeLIW4KwXpj0+iOhflA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "Robert M. Riches Jr." <rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, May 30, 2012 at 6:25 AM, Robert M. Riches Jr.
<rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org> wrote:
> Is it considered safe to rmmod nouveau and then modprobe it back
> again? =A0I have a diskless system with a different card I could try
> that with to gain confidence if the list says it's safe to do that.
>
> Thanks,
>
> Robert Riches
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

On Wed, May 30, 2012 at 6:25 AM, Robert M. Riches Jr.
<rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org> wrote:
> Is it considered safe to rmmod nouveau and then modprobe it back
> again? =A0I have a diskless system with a different card I could try
> that with to gain confidence if the list says it's safe to do that.
>
> Thanks,
>
> Robert Riches
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

I very doubt that rmmod and modprobe will help you in any way since
nouveau is KMS module and it stays in use the whole time. Something
will be broken anyway. But you can try and see what's happening, it
will not brick your card.
