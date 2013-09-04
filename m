From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH] drm/nouveau: fix command submission to use vmalloc for
	big allocations
Date: Wed, 04 Sep 2013 14:27:29 +0200
Message-ID: <52272731.8040203@canonical.com>
References: <1378132291-19577-1-git-send-email-maarten.lankhorst@canonical.com>
	<CACAvsv5Ok_3Mf6SQ=ZX4T3Ypy1rV__bRt_eWOLU=HhRJcJNrSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CACAvsv5Ok_3Mf6SQ=ZX4T3Ypy1rV__bRt_eWOLU=HhRJcJNrSw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Op 04-09-13 05:31, Ben Skeggs schreef:
> On Tue, Sep 3, 2013 at 12:31 AM, Maarten Lankhorst
> <maarten.lankhorst@canonical.com> wrote:
>> I was getting a order 4 allocation failure from kmalloc when testing some game
>> after a few days uptime with some suspend/resumes. For big allocations vmalloc
>> should be used instead.
> I've picked up this patch with a minor modification (see below)
>
>> Also limit size more aggressively to 256 KiB.
> I dropped this, it's *completely* useless, the sizes are already
> enforced right at the beginning of the ioctl (shockingly, the max size
> is going to be 256KiB already)...
>
Thanks, I wonder how I missed that. :-)

~Maarten
