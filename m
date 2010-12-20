From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] nvfx: restore BEGIN_RING usage
Date: Mon, 20 Dec 2010 23:24:18 +0100
Message-ID: <1292883858.3094.272.camel@workstation>
References: <1292845814-23623-1-git-send-email-chantry.xavier@gmail.com>
	<AANLkTimdVTJ6PLxOFqGM1qF-2x454EY1if93TumSu9Cv@mail.gmail.com>
	<AANLkTik97Sy93pMQN4c6LZtHQ-pJ16r13zw9jrYH0Sg=@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTik97Sy93pMQN4c6LZtHQ-pJ16r13zw9jrYH0Sg=@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I would really like to test your patch on nv47, but it doesn't apply to
current master. It seems to be fixable manually, as only the line
numbers in the diff are wrong, but i wonder what's the reason for this.

-- lynxeye

Am Montag, den 20.12.2010, 22:58 +0100 schrieb Xavier Chantry: 
> I don't know if nvfx is more performant on nv40 / pci express, so
> anyone with the hardware is also welcome to test.
