From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91738] [NV117] NULL deref in
 nvkm_i2c_try_acquire_pad, kernel 4.1
Date: Tue, 22 Sep 2015 20:45:10 +0000
Message-ID: <bug-91738-8800-V1w6mo5PBk@http.bugs.freedesktop.org/>
References: <bug-91738-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0634299118=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91738-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0634299118==
Content-Type: multipart/alternative; boundary="1442954709.88072dd2.7083"; charset="UTF-8"


--1442954709.88072dd2.7083
Date: Tue, 22 Sep 2015 20:45:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91738

--- Comment #18 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to ryanpcmcquen from comment #17)
> Created attachment 118404 [details]
> dmesg on linux 4.1.8
> 
> Just so you know, I am still getting a hard system freeze on Linux 4.1.8.
> 
> http://sprunge.us/OQUT

Are you able to try with a 4.3-rc kernel? This code got reworked to be more
sane and hopefully fixes this issue as a side-effect.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1442954709.88072dd2.7083
Date: Tue, 22 Sep 2015 20:45:09 +0000
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
          bz_status_UNCONFIRMED "
   title="UNCONFIRMED - [NV117] NULL deref in nvkm_i2c_try_acquire_pad, kernel 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_UNCONFIRMED "
   title="UNCONFIRMED - [NV117] NULL deref in nvkm_i2c_try_acquire_pad, kernel 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738">bug 91738</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to ryanpcmcquen from <a href="show_bug.cgi?id=91738#c17">comment #17</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=118404" name="attach_118404" title="dmesg on linux 4.1.8">attachment 118404</a> <a href="attachment.cgi?id=118404&amp;action=edit" title="dmesg on linux 4.1.8">[details]</a></span>
&gt; dmesg on linux 4.1.8
&gt; 
&gt; Just so you know, I am still getting a hard system freeze on Linux 4.1.8.
&gt; 
&gt; <a href="http://sprunge.us/OQUT">http://sprunge.us/OQUT</a></span >

Are you able to try with a 4.3-rc kernel? This code got reworked to be more
sane and hopefully fixes this issue as a side-effect.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442954709.88072dd2.7083--

--===============0634299118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0634299118==--
