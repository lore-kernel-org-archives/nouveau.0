From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91954] "link training failed": nouveau does not
 recover from monitor suspend
Date: Wed, 02 Mar 2016 21:43:28 +0000
Message-ID: <bug-91954-8800-o9GNrwbXep@http.bugs.freedesktop.org/>
References: <bug-91954-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0599913961=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91954-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0599913961==
Content-Type: multipart/alternative; boundary="14569550081.5D326.4165";
 charset="UTF-8"


--14569550081.5D326.4165
Date: Wed, 2 Mar 2016 21:43:28 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=91954

--- Comment #8 from Géza Búza <bghome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 122088
  --> https://bugs.freedesktop.org/attachment.cgi?id=122088&action=edit
Kernel 4.5-rc6 log of detaching and re-attaching external monitor

A fix is landed in kernel 4.5-rc6 which addresses this issue. See Ben's commit
here:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=95664e66fad964c3dd7945d6edfb1d0931844664

I have been running rc6 kernel for 3 days now and haven't run into this bug
since then.

However I still see the "link training failed" error in the logs when the
monitor is unplugged. Fortunately it does not bring down Xorg server.
See the attached log file for more details.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14569550081.5D326.4165
Date: Wed, 2 Mar 2016 21:43:28 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - &quot;link training failed&quot;: nouveau does not recover from monitor suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91954#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - &quot;link training failed&quot;: nouveau does not recover from monitor suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91954">bug 91954</a>
              from <span class="vcard"><a class="email" href="mailto:bghome&#64;gmail.com" title="Géza Búza &lt;bghome&#64;gmail.com&gt;"> <span class="fn">Géza Búza</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=122088" name="attach_122088" title="Kernel 4.5-rc6 log of detaching and re-attaching external monitor">attachment 122088</a> <a href="attachment.cgi?id=122088&amp;action=edit" title="Kernel 4.5-rc6 log of detaching and re-attaching external monitor">[details]</a></span>
Kernel 4.5-rc6 log of detaching and re-attaching external monitor

A fix is landed in kernel 4.5-rc6 which addresses this issue. See Ben's commit
here:
<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=95664e66fad964c3dd7945d6edfb1d0931844664">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=95664e66fad964c3dd7945d6edfb1d0931844664</a>

I have been running rc6 kernel for 3 days now and haven't run into this bug
since then.

However I still see the &quot;link training failed&quot; error in the logs when the
monitor is unplugged. Fortunately it does not bring down Xorg server.
See the attached log file for more details.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14569550081.5D326.4165--

--===============0599913961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0599913961==--
