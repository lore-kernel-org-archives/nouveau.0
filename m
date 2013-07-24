From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: [PATCH] [RFC] drm/nouveau: bring back hdmi audio device after
	switcheroo power down
Date: Wed, 24 Jul 2013 15:06:35 +0300
Message-ID: <20130724120635.GY2924@reaktio.net>
References: <1374650022-17865-1-git-send-email-airlied@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1374650022-17865-1-git-send-email-airlied@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Dave Airlie <airlied@gmail.com>
Cc: tiwai@suse.de, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Wed, Jul 24, 2013 at 05:13:42PM +1000, Dave Airlie wrote:
> After a full device powerdown via the optimus power switch, we seem
> to lose the HDMI device completely on power on, this keep track of
> whether we had a hdmi audio sub function device at power on, and
> pokes a magic register to make it reappear after the optimus power
> switch is thrown.
> 
> This at least works on my NVC4 machine, probably needs testing on
> a few other laptops with other nvidia GPUs.
> 

Sorry for a stupid question, but how do you test "optimus power switch" ? 
(I have a laptop with hybrid Optimus graphics, so I could test..)

Thanks,

-- Pasi 
