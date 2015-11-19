From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92761] [NVF0] dmesg full of nouveau E[
 PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301 (0x01024215)
Date: Thu, 19 Nov 2015 22:48:35 +0000
Message-ID: <bug-92761-8800-eW8D9YcPNz@http.bugs.freedesktop.org/>
References: <bug-92761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1814309997=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1814309997==
Content-Type: multipart/alternative; boundary="1447973315.DcFBD71.11533"; charset="UTF-8"


--1447973315.DcFBD71.11533
Date: Thu, 19 Nov 2015 22:48:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92761

--- Comment #7 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 119955
  --> https://bugs.freedesktop.org/attachment.cgi?id=119955&action=edit
test patch

Thanks for the trace.

Are you able to give the attached patch a try and see if it helps the situation
at all?  A more complete solution is probably required in general, but this
might help in your case.

Thanks,
Ben.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447973315.DcFBD71.11533
Date: Thu, 19 Nov 2015 22:48:35 +0000
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
   title="NEW - [NVF0] dmesg full of nouveau E[ PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301 (0x01024215)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92761#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVF0] dmesg full of nouveau E[ PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301 (0x01024215)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92761">bug 92761</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=119955" name="attach_119955" title="test patch">attachment 119955</a> <a href="attachment.cgi?id=119955&amp;action=edit" title="test patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=92761&amp;attachment=119955'>[review]</a>
test patch

Thanks for the trace.

Are you able to give the attached patch a try and see if it helps the situation
at all?  A more complete solution is probably required in general, but this
might help in your case.

Thanks,
Ben.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447973315.DcFBD71.11533--

--===============1814309997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1814309997==--
