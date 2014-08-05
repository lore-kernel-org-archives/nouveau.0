From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82152] [NVE7] NULL deref when putting card back to
 sleep after unsuccessful init (HUB_INIT timeout)
Date: Tue, 05 Aug 2014 00:31:19 +0000
Message-ID: <bug-82152-8800-m2RFUoM2d1@http.bugs.freedesktop.org/>
References: <bug-82152-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1854699118=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82152-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1854699118==
Content-Type: multipart/alternative; boundary="1407198679.f1f1eCd00.1686"; charset="us-ascii"


--1407198679.f1f1eCd00.1686
Date: Tue, 5 Aug 2014 00:31:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82152

--- Comment #8 from Patrick Burroughs <celticmadman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 104031
  --> https://bugs.freedesktop.org/attachment.cgi?id=104031&action=edit
dmesg output using DRI3

Using DRI3 defers all errors until after attempting to run an OpenGL
application with DRI_PRIME=1, and prevents the crash from bringing down X or
the kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407198679.f1f1eCd00.1686
Date: Tue, 5 Aug 2014 00:31:19 +0000
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
   title="NEW --- - [NVE7] NULL deref when putting card back to sleep after unsuccessful init (HUB_INIT timeout)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82152#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] NULL deref when putting card back to sleep after unsuccessful init (HUB_INIT timeout)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82152">bug 82152</a>
              from <span class="vcard"><a class="email" href="mailto:celticmadman&#64;gmail.com" title="Patrick Burroughs &lt;celticmadman&#64;gmail.com&gt;"> <span class="fn">Patrick Burroughs</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=104031" name="attach_104031" title="dmesg output using DRI3">attachment 104031</a> <a href="attachment.cgi?id=104031&amp;action=edit" title="dmesg output using DRI3">[details]</a></span>
dmesg output using DRI3

Using DRI3 defers all errors until after attempting to run an OpenGL
application with DRI_PRIME=1, and prevents the crash from bringing down X or
the kernel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407198679.f1f1eCd00.1686--

--===============1854699118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1854699118==--
