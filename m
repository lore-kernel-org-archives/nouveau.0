From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91319] Nouveau driver cannot extract FCODE ROM / DCB
 Block from OpenFirmware Device tree
Date: Mon, 13 Jul 2015 09:28:28 +0000
Message-ID: <bug-91319-8800-y2Cigse6tX@http.bugs.freedesktop.org/>
References: <bug-91319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0635359463=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0635359463==
Content-Type: multipart/alternative; boundary="1436779707.ae8E1.25690"; charset="UTF-8"


--1436779707.ae8E1.25690
Date: Mon, 13 Jul 2015 09:28:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91319

Peter Saisanas <psaisanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |psaisanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Peter Saisanas <psaisanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 117085
  --> https://bugs.freedesktop.org/attachment.cgi?id=117085&action=edit
dmesg log with "nouveau.debug=debug,VBIOS=trace"

booting kernel 4.1.2 with "nouveau.debug=debug,VBIOS=trace" appended on kernel
command line.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436779707.ae8E1.25690
Date: Mon, 13 Jul 2015 09:28:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:psaisanas&#64;gmail.com" title="Peter Saisanas &lt;psaisanas&#64;gmail.com&gt;"> <span class="fn">Peter Saisanas</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver cannot extract FCODE ROM / DCB Block from OpenFirmware Device tree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91319">bug 91319</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>psaisanas&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver cannot extract FCODE ROM / DCB Block from OpenFirmware Device tree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91319#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver cannot extract FCODE ROM / DCB Block from OpenFirmware Device tree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91319">bug 91319</a>
              from <span class="vcard"><a class="email" href="mailto:psaisanas&#64;gmail.com" title="Peter Saisanas &lt;psaisanas&#64;gmail.com&gt;"> <span class="fn">Peter Saisanas</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=117085" name="attach_117085" title="dmesg log with &quot;nouveau.debug=debug,VBIOS=trace&quot;">attachment 117085</a> <a href="attachment.cgi?id=117085&amp;action=edit" title="dmesg log with &quot;nouveau.debug=debug,VBIOS=trace&quot;">[details]</a></span>
dmesg log with &quot;nouveau.debug=debug,VBIOS=trace&quot;

booting kernel 4.1.2 with &quot;nouveau.debug=debug,VBIOS=trace&quot; appended on kernel
command line.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436779707.ae8E1.25690--

--===============0635359463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0635359463==--
