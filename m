From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: Fix for vblank on nvc0
Date: Tue, 06 Nov 2012 19:30:00 +0100
Message-ID: <50995728.8080305@canonical.com>
References: <CAES2CiZRdkaOwYUbtp28ZMKu+DqtPOoKRwHPpLWaF2WeB6F8+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAES2CiZRdkaOwYUbtp28ZMKu+DqtPOoKRwHPpLWaF2WeB6F8+g@mail.gmail.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org



Op 06-11-12 15:48, Kelly Doran schreef:
> The vblank on nvc0 was not working correctly and would freeze X, I managed
> to track it down and fix it with some help from m.b.lankhorst, see
> https://bugs.freedesktop.org/show_bug.cgi?id=56692 for details.
>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>

I recommended the bar flush since nvd0 does as well, and there might be a small race
otherwise.

Can this still get in before final 3.7 release?

~Maarten
