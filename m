From: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [PATCH] drm/ttm: Fix race condition in ttm_bo_delayed_delete
Date: Mon, 18 Jan 2010 20:40:57 +0100
Message-ID: <4B54B949.9010906@vmware.com>
References: <1263840434-9113-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.sourceforge.net>
In-Reply-To: <1263840434-9113-1-git-send-email-luca@luca-barbieri.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=dri-devel>
List-Post: <mailto:dri-devel@lists.sourceforge.net>
List-Help: <mailto:dri-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: dri-devel-bounces@lists.sourceforge.net
To: Luca Barbieri <luca@luca-barbieri.com>
Cc: "airlied@linux.ie" <airlied@linux.ie>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.sourceforge.net" <dri-devel@lists.sourceforge.net>
List-Id: nouveau.vger.kernel.org

Luca,

Good catch.
Some comments inline:



Luca Barbieri wrote:
> +	entry = list_first_entry(&bdev->ddestroy,
> +		struct ttm_buffer_object, ddestroy);
> +	kref_get(&entry->list_kref);
>  
> -		if (next != &bdev->ddestroy) {
> -			nentry = list_entry(next, struct ttm_buffer_object,
> -					    ddestroy);
> +	for (;;) {
> +		struct ttm_buffer_object *nentry = NULL;
> +
> +		if (!list_empty(&entry->ddestroy)
> +			&& entry->ddestroy.next != &bdev->ddestroy) {
> +			nentry = list_entry(entry->ddestroy.next,
> +				struct ttm_buffer_object, ddestroy);
>   

I'm not sure it's considered ok to access the list_head members directly 
in new code.
Would  nentry=list_first_entry(&entry->ddestroy, ....) work?

>  			kref_get(&nentry->list_kref);
>  		}
>   

else unlock and break? That would save an unnecessary call to 
ttm_bo_cleanup_refs.

> -		kref_get(&entry->list_kref);
>  
>  		spin_unlock(&glob->lru_lock);
>  		ret = ttm_bo_cleanup_refs(entry, remove_all);
>  		kref_put(&entry->list_kref, ttm_bo_release_list);
> +		entry = nentry;
>   

Here nentry may have been removed from the list by another process, 
which would trigger the unnecessary call, mentioned above.

/Thomas


------------------------------------------------------------------------------
Throughout its 18-year history, RSA Conference consistently attracts the
world's best and brightest in the field, creating opportunities for Conference
attendees to learn about information security's most important issues through
interactions with peers, luminaries and emerging and established companies.
http://p.sf.net/sfu/rsaconf-dev2dev
--
