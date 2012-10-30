From: Pouar <thepouar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Virtualbox 3D accel broken in xf86-video-nouveau 1.0.3
Date: Tue, 30 Oct 2012 13:30:53 -0500
Message-ID: <50901CDD.7050008@gmail.com>
References: <ae50d07e2ee8ebb3be8f6c1277aaa895@www.spursdown.info>
	<50901C68.7020605@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2037275792=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <50901C68.7020605-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============2037275792==
Content-Type: multipart/alternative;
 boundary="------------050502060000060304050906"

This is a multi-part message in MIME format.
--------------050502060000060304050906
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/2012 01:28 PM, Pouar wrote:
> On 10/28/2012 01:21 PM, Pouar wrote:
>> On 10/28/2012 01:18 PM, Emil Velikov wrote:
>>> On Sun, 28 Oct 2012 01:15:54 -0000, Pouar wrote:
>>>
>>>> there's a regression in the xf86-video-nouveau driver that came up in
>>>> 1.0.3 that causes the desktop to bounce around in virtualbox whenever
>>>> using HW acceleration in cinnamon and gnome 3, but not in fallback or
>>>> cinnamon 2d, only happens in virtualbox and not the host, I've 
>>>> confirmed
>>>> it was the graphics driver on the host because it happened with the
>>>> 1.0.3 driver but not the 1.0.2.
>>>> anyone else having this problem? I'm using GeForce GTX 560 Ti
>>>
>>> Hi Pouar
>>>
>>> Can you open a bug, following these instructions [1]
>>>
>>> Ideally you can try bisecting the issue - there are only 10 changes 
>>> that may have caused the issue
>>>
>>> Cheers
>>> Emil
>>>
>>> [1] http://nouveau.freedesktop.org/wiki/Bugs
>> I just did
>> -- 
>> Pouar
> by I just did I meant the bug report, not thebisecting, I have zero 
> experience with driver programming, much less graphics 
> driverprogramming, so I wouldn't know what to look for, I signed up 
> for this mailing list to keep track of the different driver issues and 
> bugs and their progress
> -- 
> Pouar

-- 
Pouar

--------------050502060000060304050906
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 10/30/2012 01:28 PM, Pouar wrote:<br>
    </div>
    <blockquote cite="mid:50901C68.7020605-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" type="cite">
      <div class="moz-cite-prefix">On 10/28/2012 01:21 PM, Pouar <a
          moz-do-not-send="true" class="moz-txt-link-rfc2396E"
          href="mailto:thepouar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org"><thepouar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org></thepouar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org></a>
        wrote: <br>
      </div>
      <blockquote type="cite">
        <div class="moz-cite-prefix">On 10/28/2012 01:18 PM, Emil
          Velikov wrote:<br>
        </div>
        <blockquote cite="mid:op.wmwig8yx8t7z9u@arch-laptop" type="cite">On


          Sun, 28 Oct 2012 01:15:54 -0000, Pouar <a
            moz-do-not-send="true" class="moz-txt-link-rfc2396E"
            href="mailto:thepouar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org"><thepouar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org></thepouar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org></a>
          wrote: <br>
          <br>
          <blockquote type="cite">there's a regression in the
            xf86-video-nouveau driver that came up in <br>
            1.0.3 that causes the desktop to bounce around in virtualbox
            whenever <br>
            using HW acceleration in cinnamon and gnome 3, but not in
            fallback or <br>
            cinnamon 2d, only happens in virtualbox and not the host,
            I've confirmed <br>
            it was the graphics driver on the host because it happened
            with the <br>
            1.0.3 driver but not the 1.0.2. <br>
            anyone else having this problem? I'm using GeForce GTX 560
            Ti <br>
          </blockquote>
          <br>
          Hi Pouar <br>
          <br>
          Can you open a bug, following these instructions [1] <br>
          <br>
          Ideally you can try bisecting the issue - there are only 10
          changes that may have caused the issue <br>
          <br>
          Cheers <br>
          Emil <br>
          <br>
          [1] <a moz-do-not-send="true" class="moz-txt-link-freetext"
            href="http://nouveau.freedesktop.org/wiki/Bugs">http://nouveau.freedesktop.org/wiki/Bugs</a>
          <br>
        </blockquote>
        I just did<br>
        <div class="moz-signature">-- <br>
          <font color="000000">Pouar</font></div>
      </blockquote>
      <font color="000000">by I just did I <font color="000000">meant
          the bug report, not the<font color="000000"> bisecting, I have
            zero experience with driver programming, much less graphics
            driver<font color="000000"> programming<font color="000000">,
                so I wouldn't know what to look for, I signed up for
                this mailing list to keep track of the different driver
                <font color="000000">issues and <font color="000000">bugs
                    and their progr<font color="000000">ess</font></font></font></font></font></font></font></font><br>
      <div class="moz-signature">-- <br>
        <font color="000000">Pouar</font></div>
    </blockquote>
    <br>
    <div class="moz-signature">-- <br>
      <font color="000000">Pouar</font></div>
  </body>
</html>

--------------050502060000060304050906--

--===============2037275792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2037275792==--
