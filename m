From: "Gerd v. Egidy" <lists-6VzpN07DMvo@public.gmane.org>
Subject: Re: one desktop on four monitors ?
Date: Wed, 27 Oct 2010 14:34:36 +0200
Message-ID: <201010271434.36590.lists@egidy.de>
References: <201010240426.o9O4Qm8w007081@envy.delorie.com>
	<AANLkTik84bEYDj0A9ejLSQZA9C=1-kVA=vZV9RXOTZJ0@mail.gmail.com>
	<20101026120046.00001f3d@unknown>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101026120046.00001f3d@unknown>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

> I wanted to get 3 screen working like one single screen. No chance with
> nouveau.

I have 3 Screens working with one desktop here:

           HDMI ----------------------- Monitor1
           |
8400 card -|
           |                      DVI-- Monitor2
           DVI ---- TripleHead2Go-|
                                  DVI-- Monitor3

You just need a Matrox TripleHead2Go. To use 4 screens you'd need two of them.

Nouveau works, but currently the xinerama-info can not be tweaked. That means 
my KDE doesn't know about the 3 screens and pops up windows in between. I've 
read that it can be tweaked with a custom libxinerama but I haven't looked 
into it yet.

So I'm currently still running the Nvidia blob.

Just as note: I'm not using xinerama, but 1 big screen on one card. 
Nonetheless xinerama information is used to tell the desktop about the screens 
in use.

Kind regards,

Gerd

-- 
Address (better: trap) for people I really don't want to get mail from:
jonas-K4Lox0BdAqn6SQ/niu2adgC/G2K4zDHf@public.gmane.org
