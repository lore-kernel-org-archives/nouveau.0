From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79266] [NVC1] GT 430 / GF108 sluggish,
 unstable performance and blue tint with vdpau
Date: Mon, 26 May 2014 17:42:54 +0000
Message-ID: <bug-79266-8800-UDe3Soxduo@http.bugs.freedesktop.org/>
References: <bug-79266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1431929027=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79266-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1431929027==
Content-Type: multipart/alternative; boundary="1401126173.3C8D0dC11.23695"; charset="us-ascii"


--1401126173.3C8D0dC11.23695
Date: Mon, 26 May 2014 17:42:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79266

--- Comment #7 from C0NPAQ <afasdfsdfaa-NltIWcMOmWn1P9xLtpHBDw@public.gmane.org> ---
I am sorry if I reacted harshly. I am not aware of your organization structure. 

However, I would intuitively expect that you would leave the bug open, and
eventually more people will find it and report the same problem. Thereby it
will become clear if all GT430 are affected or if it is due to a hardware
combination. At some point a developer would have to have a closer look at the
issue and reproduce it with the same graphics card chipset at least.

I honestly have no clue but I guess it is some memory access violation, buffer
overflow issue within the card that causes the weird behavior, like 1 byte
offset in some register then the colors get weird and the video only plays if
the mouse is moved around and such. Possibly because the driver assumes the
wrong chipset. 

Someone who knows this stuff just has to look at it, test it, that's all you
can really do.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401126173.3C8D0dC11.23695
Date: Mon, 26 May 2014 17:42:53 +0000
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
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266">bug 79266</a>
              from <span class="vcard"><a class="email" href="mailto:afasdfsdfaa&#64;master.ms" title="C0NPAQ &lt;afasdfsdfaa&#64;master.ms&gt;"> <span class="fn">C0NPAQ</span></a>
</span></b>
        <pre>I am sorry if I reacted harshly. I am not aware of your organization structure. 

However, I would intuitively expect that you would leave the bug open, and
eventually more people will find it and report the same problem. Thereby it
will become clear if all GT430 are affected or if it is due to a hardware
combination. At some point a developer would have to have a closer look at the
issue and reproduce it with the same graphics card chipset at least.

I honestly have no clue but I guess it is some memory access violation, buffer
overflow issue within the card that causes the weird behavior, like 1 byte
offset in some register then the colors get weird and the video only plays if
the mouse is moved around and such. Possibly because the driver assumes the
wrong chipset. 

Someone who knows this stuff just has to look at it, test it, that's all you
can really do.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401126173.3C8D0dC11.23695--

--===============1431929027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1431929027==--
