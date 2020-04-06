From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 03/17] drm: Nuke mode->vrefresh
Date: Mon, 06 Apr 2020 11:32:38 +0300
Message-ID: <87tv1xko9l.fsf@intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-4-ville.syrjala@linux.intel.com>
 <5d677ff317089267407609a1faa64b13@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <5d677ff317089267407609a1faa64b13@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: abhinavk@codeaurora.org, Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org, Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, aravindh@quicinc.com, Emil Velikov <emil.velikov@collabora.com>, Thomas Hellstrom <thellstrom@vmware.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>, Jerry Han <hanxu5@huaqin.corp-partner.google.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>, Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>, pdhaval@quicinc.com, Ben Skeggs <bskeggs@redhat.com>, Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org, nganji@quicinc.com, linux-amlogic@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>, Jernej
List-Id: nouveau.vger.kernel.org

On Fri, 03 Apr 2020, abhinavk@codeaurora.org wrote:
> On 2020-04-03 13:39, Ville Syrjala wrote:
>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>> index fec1c33b3045..e3d5f011f7bd 100644
>> --- a/drivers/gpu/drm/drm_modes.c
>> +++ b/drivers/gpu/drm/drm_modes.c
>> @@ -759,9 +759,7 @@ int drm_mode_vrefresh(const struct drm_display_mode 
>> *mode)
>>  {
>>  	int refresh = 0;
>> 
>> -	if (mode->vrefresh > 0)
>> -		refresh = mode->vrefresh;
>
> The mode->vrefresh has been replaced with calling this API in all its 
> usages.
> However in this API, the above if statement was returning the vrefresh 
> if it was already
> set. mode->clock is holding the pixel clock . So this will not cause any 
> issues in non-compressed cases.
> In case of compression like DSC, the pixel
> clock will be different based on the compression ratio hence the 
> mode->clock will change but fps will not.
> So we did have usages in our downstream driver where we would use this 
> API and the refresh rate
> returned will be the mode->vrefresh which did not change but after this 
> change for those cases it will end up returning the refresh rate 
> calculated using mode->clock which will result in a different value now.
> So is the recommendation that even in the case of compression 
> mode->clock should always hold
> uncompressed pixel clock value because with this part of the change we 
> will now get a different value when we call this API.

Yes. The mode remains the same regardless of compression, and
compression is just an implementation detail of the transport.

You may need to maintain separate "physical port clock" and "logical
port clock" for DSC, where the latter is a function of the former and
the DSC parameters. And then you can see if your logical port clock
provides enough bandwidth for your mode. But this is up to your driver
and encoder implementation.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
