From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: Fix for vblank on nvc0
Date: Mon, 12 Nov 2012 22:52:38 +0100
Message-ID: <50A16FA6.5040002@canonical.com>
References: <CAES2CiZRdkaOwYUbtp28ZMKu+DqtPOoKRwHPpLWaF2WeB6F8+g@mail.gmail.com>
	<50995728.8080305@canonical.com> <20121111182617.GA15689@joi.lan>
	<20121111183519.GA2959@joi.lan> <50A009B8.2080107@canonical.com>
	<CAES2CiYwSChUaDp1Z=5W0t34D54D7HfqH2cqvWXuWxUW69szTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAES2CiYwSChUaDp1Z=5W0t34D54D7HfqH2cqvWXuWxUW69szTw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Kelly Doran <kel.p.doran@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

Op 12-11-12 22:30, Kelly Doran schreef:
> I had Sven test this patch... he said it works.  I think chipset
> number test was executing code that we thought was only either 0x50 or
> 0xc0, but was actually more specific with things like 0x92.
>
Oh right vblank is busted anyway... needs to be nv_device(priv-)>card_type == NV_50 to work.

Your patch is the correct fix.

~Maarten
