From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77230] [NV4B] NV40 PGRAPH "unknown bits" - windows
 render in white
Date: Thu, 10 Apr 2014 08:33:04 +0000
Message-ID: <bug-77230-8800-FEvldRm8hc@http.bugs.freedesktop.org/>
References: <bug-77230-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0833820208=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77230-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0833820208==
Content-Type: multipart/alternative; boundary="1397118784.075Fd1.2689"; charset="us-ascii"


--1397118784.075Fd1.2689
Date: Thu, 10 Apr 2014 08:33:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77230

--- Comment #2 from Troy <guinness.meredith-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thank-you Ilia!

On Fedora 20 I have created a minimalist config containing only:

Section "Device"
    Identifier "Videocard0"
    Driver "nouveau"
    Option "NoAccel" "true"
EndSection

... and am now able to login and work normally, although understandably
graphics are slower (but better than remote desktop).

You mention the issue may be related to a hardware error.  Is this (ie
"working" when hw acceleration disabled) conclusive proof, or is there some
other test I can do to confirm this?  Like memtest for the GPU?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397118784.075Fd1.2689
Date: Thu, 10 Apr 2014 08:33:04 +0000
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
   title="NEW --- - [NV4B] NV40 PGRAPH &quot;unknown bits&quot; - windows render in white"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77230#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] NV40 PGRAPH &quot;unknown bits&quot; - windows render in white"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77230">bug 77230</a>
              from <span class="vcard"><a class="email" href="mailto:guinness.meredith&#64;gmail.com" title="Troy &lt;guinness.meredith&#64;gmail.com&gt;"> <span class="fn">Troy</span></a>
</span></b>
        <pre>Thank-you Ilia!

On Fedora 20 I have created a minimalist config containing only:

Section &quot;Device&quot;
    Identifier &quot;Videocard0&quot;
    Driver &quot;nouveau&quot;
    Option &quot;NoAccel&quot; &quot;true&quot;
EndSection

... and am now able to login and work normally, although understandably
graphics are slower (but better than remote desktop).

You mention the issue may be related to a hardware error.  Is this (ie
&quot;working&quot; when hw acceleration disabled) conclusive proof, or is there some
other test I can do to confirm this?  Like memtest for the GPU?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397118784.075Fd1.2689--

--===============0833820208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0833820208==--
