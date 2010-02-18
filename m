From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau: [drm] failed to open device
Date: Thu, 18 Feb 2010 17:05:40 +0100
Message-ID: <b67489df1002180805i1b51084bh38b468bf8955c20b@mail.gmail.com>
References: <20100218093834.GE29559@buzzloop.caiaq.de>
	<b67489df1002180337m274aa72dueb33b7038d541c31@mail.gmail.com>
	<20100218115524.GO9007@buzzloop.caiaq.de>
	<b67489df1002180401o4629435bj71c764a85e06a54@mail.gmail.com>
	<20100218130505.GP28972@buzzloop.caiaq.de>
	<b67489df1002180642n53d35b54lba403904f5cfa0f@mail.gmail.com>
	<20100218150411.GX28972@buzzloop.caiaq.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100218150411.GX28972-ahpEBR4enfnCULTFXS99ULNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Daniel Mack <daniel-rDUAYElUppE@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Feb 18, 2010 at 4:04 PM, Daniel Mack <daniel-rDUAYElUppE@public.gmane.org> wrote:
> On Thu, Feb 18, 2010 at 03:42:52PM +0100, Xavier Chantry wrote:
>> On Thu, Feb 18, 2010 at 2:05 PM, Daniel Mack <daniel-rDUAYElUppE@public.gmane.org> wrote:
>> >>
>> >> Which libdrm version are you using ?
>> >
>> > 2.4.0, built from the git sources yesterday.
>> >
>>
>> "Bump of the userspace interface to 0.0.16.
>> libdrm and nouveau drm have to be updated together for nouveau to keep
>> working. The kernel.org version will not work with the current git
>> user space for some time. See the kernel commit log for more
>> information. "
>>
>> This means kernel.org tree does not work with libdrm git.
>> (so you can either use older git userspace or a newer nouveau drm module/kernel)
>>
>> If this is not clear enough, do you have a suggestion for rephrasing
>> the paragraph on the frontpage ?
>
> I am deeply sorry, really. This one line of text right above the the
> actual headline was indeed the information I overlooked. I scanned the
> FAQ and TroubleShooting sections, but missed this, grr.
>
>> I suppose we could also add an entry in either Faq or Troubleshooting.
>
> Yes, I think adding it there would help. Not only me ;)
>

http://nouveau.freedesktop.org/wiki/TroubleShooting

I think it was already covered with this basic question :
<<<
Are you using the latest code?
      Make sure you use the latest available Nouveau code from the git
repositories listed in FrontPage: DDX, DRM and Nouveau kernel. And
this really means GIT, not your just distribution's latest package.
GIT as of TODAY . Kernel.org git repositories do not count, use the
freedesktop.org repositories. As long as Nouveau is in staging in the
Linux kernel, the user space ABI can break. This means that the git
version of libdrm or DDX does not work with the kernel.org version of
Nouveau code, until the changes flow upstream.
>>>

But I added a new section anyway.
