From: Dave Airlie <airlied@gmail.com>
Subject: Re: [Nouveau] [PATCH v2] vga16fb: refuse to load in face of other
	driver controlling primary card
Date: Sun, 25 Jul 2010 18:42:48 +1000
Message-ID: <AANLkTimQZ6_+o=3pGa6hGbeFU99RMPFRmO+ndMZDHZMS@mail.gmail.com>
References: <20100720191923.GA11056@joi.lan>
	<20100722172039.e935c67d.akpm@linux-foundation.org>
	<20100723131034.GA6618@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100723131034.GA6618@joi.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jul 23, 2010 at 11:10 PM, Marcin Slusarz
<marcin.slusarz@gmail.com> wrote:
> On Thu, Jul 22, 2010 at 05:20:39PM -0700, Andrew Morton wrote:
>> On Tue, 20 Jul 2010 21:19:23 +0200
>> Marcin Slusarz <marcin.slusarz@gmail.com> wrote:
>>
>> > We don't want vga16fb to mess with hardware initialized by other driver.
>> > Detect it and refuse to load.
>> > It fixes nouveau interrupt storm on some machines.

Can't we keep this all inside vga16fb? just have it walk PCI tree
looking for a primary VGA card, and if it has a driver bound, just
refuse to bind.

Dave.
