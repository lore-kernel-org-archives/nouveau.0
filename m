From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: Fix for vblank on nvc0
Date: Sun, 11 Nov 2012 21:25:28 +0100
Message-ID: <50A009B8.2080107@canonical.com>
References: <CAES2CiZRdkaOwYUbtp28ZMKu+DqtPOoKRwHPpLWaF2WeB6F8+g@mail.gmail.com>
	<50995728.8080305@canonical.com> <20121111182617.GA15689@joi.lan>
	<20121111183519.GA2959@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20121111183519.GA2959@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: Kelly Doran <kel.p.doran@gmail.com>, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Op 11-11-12 19:35, Marcin Slusarz schreef:
> On Sun, Nov 11, 2012 at 07:26:17PM +0100, Marcin Slusarz wrote:
>> On Tue, Nov 06, 2012 at 07:30:00PM +0100, Maarten Lankhorst wrote:
>>>
>>> Op 06-11-12 15:48, Kelly Doran schreef:
>>>> The vblank on nvc0 was not working correctly and would freeze X, I managed
>>>> to track it down and fix it with some help from m.b.lankhorst, see
>>>> https://bugs.freedesktop.org/show_bug.cgi?id=56692 for details.
>>>>
>>> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
>>>
>>> I recommended the bar flush since nvd0 does as well, and there might be a small race
>>> otherwise.
>>>
>>> Can this still get in before final 3.7 release?
>> This patch breaks vblank here (nv92) completely.
Does removing the bar flush help?

~Maarte
