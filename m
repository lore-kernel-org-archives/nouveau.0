From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ext4/xfs: add page refcount helper
Date: Mon, 28 Sep 2020 15:20:48 -0700
Message-ID: <e56a1de5-6bd7-9f18-60ce-0493bcdc6413@nvidia.com>
References: <20200925204442.31348-1-rcampbell@nvidia.com>
 <20200925204442.31348-2-rcampbell@nvidia.com> <20200926063539.GA3540@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200926063539.GA3540-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: Yang Shi <yang.shi-KPsoFbNs7GizrGE5bRqYAgC/G2K4zDHf@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Paul Mackerras <paulus-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "Kirill A . Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 9/25/20 11:35 PM, Christoph Hellwig wrote:
> On Fri, Sep 25, 2020 at 01:44:41PM -0700, Ralph Campbell wrote:
>>   		error = ___wait_var_event(&page->_refcount,
>> -				atomic_read(&page->_refcount) == 1,
>> +				dax_layout_is_idle_page(page),
>>   				TASK_INTERRUPTIBLE, 0, 0,
>>   				ext4_wait_dax_page(ei));
> 
>> +++ b/fs/xfs/xfs_file.c
>> @@ -750,7 +750,7 @@ xfs_break_dax_layouts(
>>   
>>   	*retry = true;
>>   	return ___wait_var_event(&page->_refcount,
>> -			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
>> +			dax_layout_is_idle_page(page), TASK_INTERRUPTIBLE,
>>   			0, 0, xfs_wait_dax_page(inode));
>>   }
> 
> I still think a litte helper macro would be nice here:
> 
> #define dax_wait_page(_inode, _page, _wait_cb)				\
>    	___wait_var_event(&(_page)->_refcount,				\
> 		atomic_read(&(_page)->_refcount) == 1,			\
> 		TASK_INTERRUPTIBLE, dax_layout_is_idle_page(_page),	\
> 		TASK_INTERRUPTIBLE, 0, 0, _wait_cb(_inode));

OK, I'll add it in v3.
