From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60772] xf86-video-nouveau fails to modprobe nouveau:
 KMS not enabled
Date: Mon, 18 Feb 2013 09:04:57 +0000
Message-ID: <bug-60772-8800-k7unvENOSO@http.bugs.freedesktop.org/>
References: <bug-60772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1045339477=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60772-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1045339477==
Content-Type: multipart/alternative; boundary="1361178297.8d4CcEB1.27523"; charset="us-ascii"


--1361178297.8d4CcEB1.27523
Date: Mon, 18 Feb 2013 09:04:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60772

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
On 18/02/13 00:47, Dave Airlie wrote:> On Sun, Feb 17, 2013 at 6:48 AM, Emil
Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> "Regression" caused by
>> commit e34cfbd5bd23f7f15372af52d8a39a5715ce7310
>> Author: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Date:   Fri Nov 2 03:57:41 2012 +0000
>>
>>     nouveau: Factor out common code to NVHasKMS()
>>
>>     As the name suggests checks if it has kernel mode setting,
>>     prints out the interface version and checkes if the chipset
>>     is supported
>>
>>     Function is used in NVPciProbe and NVPlatformProbe
>>
>> Without this change X will fail with '[drm] KMS not enabled' if
>> the kernel module is not loaded
> 
> Thats correct, the X server is not responsible for loading the kernel module.
> 
> If the kernel module isn't loaded then there is a bug elsewhere.
> 
> Dave.
>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361178297.8d4CcEB1.27523
Date: Mon, 18 Feb 2013 09:04:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772">bug 60772</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>On 18/02/13 00:47, Dave Airlie wrote:&gt; On Sun, Feb 17, 2013 at 6:48 AM, Emil
Velikov &lt;<a href="mailto:emil.l.velikov&#64;gmail.com">emil.l.velikov&#64;gmail.com</a>&gt; wrote:
<span class="quote">&gt;&gt; &quot;Regression&quot; caused by
&gt;&gt; commit e34cfbd5bd23f7f15372af52d8a39a5715ce7310
&gt;&gt; Author: Emil Velikov &lt;<a href="mailto:emil.l.velikov&#64;gmail.com">emil.l.velikov&#64;gmail.com</a>&gt;
&gt;&gt; Date:   Fri Nov 2 03:57:41 2012 +0000
&gt;&gt;
&gt;&gt;     nouveau: Factor out common code to NVHasKMS()
&gt;&gt;
&gt;&gt;     As the name suggests checks if it has kernel mode setting,
&gt;&gt;     prints out the interface version and checkes if the chipset
&gt;&gt;     is supported
&gt;&gt;
&gt;&gt;     Function is used in NVPciProbe and NVPlatformProbe
&gt;&gt;
&gt;&gt; Without this change X will fail with '[drm] KMS not enabled' if
&gt;&gt; the kernel module is not loaded
&gt; 
&gt; Thats correct, the X server is not responsible for loading the kernel module.
&gt; 
&gt; If the kernel module isn't loaded then there is a bug elsewhere.
&gt; 
&gt; Dave.</span >
&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361178297.8d4CcEB1.27523--

--===============1045339477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1045339477==--
