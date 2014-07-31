From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH 00/17] Convert TTM to the new fence interface. v2
Date: Thu, 31 Jul 2014 17:35:39 +0200
Message-ID: <53DA624B.9000403@canonical.com>
References: <20140731152809.14619.29424.stgit@patser>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140731152809.14619.29424.stgit@patser>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie
Cc: thellstrom@vmware.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com, alexander.deucher@amd.com, christian.koenig@amd.com
List-Id: nouveau.vger.kernel.org

op 31-07-14 17:30, Maarten Lankhorst schreef:
> This series applies on top of the driver-core-next branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
>
> Before converting ttm to the new fence interface I had to fix some
> drivers to require a reservation before poking with fence_obj.
> After flipping the switch RCU becomes available instead, and
> the extra reservations can be dropped again. 
>
> I've done at least basic testing on all the drivers I've converted
> at some point, but more testing is definitely welcomed!
>
> Changes since v1:
> - Almost all radeon changes, radeon reworked their page flip code which
>   made things easier for me.
> - Added a delayed work for radeon that checks gpu lockups.
> - Reworked the radeon fence implementation to remove deadlocks,
>   and end up slightly cleaner.
>
Oops, managed to screw up sending patches. There are 19 patches in this series, starting with

[PATCH 01/19] fence: add debugging lines to fence_is_signaled for the callback

Sorry for the noise.

~Maarten
