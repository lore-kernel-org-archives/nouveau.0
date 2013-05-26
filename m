From: Gard Spreemann <gspreemann@gmail.com>
Subject: Re: Commit "drm: run the hpd irq event code directly" causes stutter
	from repeated EDID retrievals
Date: Sun, 26 May 2013 18:25:43 +0200
Message-ID: <1486851.BFel1pU9A1@giraffe>
References: <4298860.NTVPviymN4@giraffe>
	<CAKMK7uGtJZOJzLm1sR07EN5DySX_V08q32cMEUdN=BrBPB3WsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAKMK7uGtJZOJzLm1sR07EN5DySX_V08q32cMEUdN=BrBPB3WsA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Sunday 26 May 2013 18:14:06 Daniel Vetter wrote:
> My guess is that you've worked around these edid stalls with
> drm_kms_helper.poll=0 and the above commit breaks that w/a. That patch
> was shot down unfortunately. If you can't reproduce these stalls on
> older kernels when removing the poll=0 option, then something else
> broke.

You are correct. Before that commit, the stuttering behavior is present with 
poll=1, but not with poll=0. Starting with that commit, the behavior is 
present nomatter the poll setting.

Am I correct in thinking that this is a problem without a clear solution?

- Gard
