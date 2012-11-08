From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [PATCH] nouveau: fix acpi edid retrieval
Date: Thu, 08 Nov 2012 21:56:59 +0100
Message-ID: <509C1C9B.20402@canonical.com>
References: <509BDB9A.5020402@canonical.com>
	<1352407992.4254.4.camel@mattotaupa>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1352407992.4254.4.camel@mattotaupa>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Paul Menzel <paulepanter@users.sourceforge.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Op 08-11-12 21:53, Paul Menzel schreef:
> Dear Maarten,
>
>
> thanks for the patch.
>
>
> Am Donnerstag, den 08.11.2012, 17:19 +0100 schrieb Maarten Lankhorst:
>> Commit c0077061e7ea
> Please paste the commit summary for people not having a Git tree at
> hand.

The summary will go in the commit log, at which point you can simply do a search for it. :-)
But yeah maybe add it for the record.

"Commit c0077061e7ea (drm/nouveau/acpi: move definitions out of nouveau_drv.h)"

>> accidentally inverted the logic for nouveau_acpi_edid, causing it to
>> only show a connector as connected when the edid could not be retrieved with acpi.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
>> ---
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
>> index 9a6e2cb..d3595b2 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
>> @@ -355,7 +355,7 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
>>  	 * valid - it's not (rh#613284)
>>  	 */
>>  	if (nv_encoder->dcb->lvdsconf.use_acpi_for_edid) {
>> -		if (!(nv_connector->edid = nouveau_acpi_edid(dev, connector))) {
>> +		if ((nv_connector->edid = nouveau_acpi_edid(dev, connector))) {
> One pair of parentheses can go now?
No, gcc will warn about it if you try, since it's an assignment not a equality operator.
>>  			status = connector_status_connected;
>>  			goto out;
>>  		}
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
>
>
> Thanks,
>
> Paul
