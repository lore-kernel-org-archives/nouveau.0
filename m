From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [BUG ?] Nouveau driver on 330M GT
Date: Wed, 16 Jun 2010 06:58:25 +1000
Message-ID: <1276635505.14136.1.camel@araqiel>
References: <201006111052.29187.goretux@gmail.com>
	 <201006151318.08619.goretux@gmail.com> <1276601463.2526.4.camel@nisroch>
	 <201006151506.27154.goretux@gmail.com>
Reply-To: skeggsb@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201006151506.27154.goretux@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Lacombe <goretux@gmail.com>
Cc: Younes Manton <younes.m@gmail.com>, Dave Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Tue, 2010-06-15 at 15:06 +0200, Eric Lacombe wrote:
> > Is this a system with switchable graphics (Optimus probably)?  If so,
> > fiddle with your BIOS options and try and enable only the NVIDIA board.
> 
> oops, my fault... I forgot to switch to the nvidia chip (my laptop is a sony 
> vaio Z11Z9E) with the button. Here the new drm logs with a 2.6.35-rc2 kernel :
Aah, yep, that's much better.  I've seen what I believe to be a similar
issue reported, but other things have prevented me looking at it
properly yet.

I'm on holidays for the next 2 weeks, but I'll get back to looking at it
then.  The only suggestion so far is to make sure you're using the very
latest code from nouveau git, just to make sure it's not already
fixed :)

Ben.
