From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: vdpau problems and logging
Date: Tue, 12 Mar 2013 22:22:40 +0100
Message-ID: <513F9CA0.3020100@canonical.com>
References: <CADXEQv8Ta0dUCeUxP4P5uJyNrfJ8qMfCvoXCF_7H0FAQpqtbEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CADXEQv8Ta0dUCeUxP4P5uJyNrfJ8qMfCvoXCF_7H0FAQpqtbEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Steven Ward <nightcast2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hey,
\
Op 12-03-13 20:18, Steven Ward schreef:
> Dear all,
>              I'm writing about  setup  vdpau firmware with  the nouveau
> driver according to this page:
>
> http://nouveau.freedesktop.org/wiki/NVC0_Firmware  I have  installed  the
> nvidia-313 binary drver to attempt  to extract  the firmware. I have
> obtained another mmiotrace  using  my  default  kernel I have installed  on
> my Chakra  Distrobution.  I  have  used  the  instructions  on the  wiki
> page.
>
>
> I  had some mixed results using the instructions. I didn't get anywhere
> with  using the demmio  from rnn  in envytools, but  I have  got some
> output using  the demmio  command.
>
> I will  be  uploading the output  in different files.  I did only once get
> lucky with the last instructions, valgrind , but I can't seem to  get any
> more "vuc" files. I hae saved the ones  I have and put them into
> "/lib/firmware/nouveau"  and  I have copied  them into my external hardrive.
>
> I  have tried  playing a  .mkv video which  I know it works  with the  313
> binary driver.
> I know it doesn't work  with  the  nouveau  driver and the "vuc" files I
> extracted.
>
> I will  upload  all  the  output I have created In tar.xz  format  attached
> to a  series  of e-mails.
>
Are you on an ancient xserver-xorg-video-nouveau by any chance? Anything from
2012 or later should be good enough, it's commit d575a28a502 that tells it to
load libvdpau_nouveau.so instead of nvidia. You might need to update libvdpau too.

The vuc files are probably ok, but it's not going to work without the kernel firmware files.

The ones I'm getting are:
vuc-h264-0  vuc-mpeg12-0  vuc-mpeg4-0  vuc-mpeg4-1  vuc-vc1-0  vuc-vc1-1  vuc-vc1-2

This is enough for all codecs, but it will just fail later on without userspace codecs. It should
attempt to create the kernel stuff first, which it doesn't from what I can tell from your logs.


~Maarten
