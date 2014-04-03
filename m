From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Thu, 03 Apr 2014 10:08:30 +0000
Message-ID: <bug-70354-8800-OZoGaUWWG2@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0846937227=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0846937227==
Content-Type: multipart/alternative; boundary="1396519710.Afd3A7C5.27268"; charset="us-ascii"


--1396519710.Afd3A7C5.27268
Date: Thu, 3 Apr 2014 10:08:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #27 from D. Moens <d-bugzilla-vUpi/VKO0VA@public.gmane.org> ---
Created attachment 96836
  --> https://bugs.freedesktop.org/attachment.cgi?id=96836&action=edit
dmesg | egrep -i "nouveau|drm"

Testing with GK106GLM [Quadro K2100M], QHD+ (3200x1800) screen.

MMIO FAULT is reproducible with kernel 3.14 & darktama's git 
633e16bb8571071b9da8ed03513a2266cbf21eb5.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396519710.Afd3A7C5.27268
Date: Thu, 3 Apr 2014 10:08:30 +0000
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
   title="NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:d-bugzilla&#64;moens.cc" title="D. Moens &lt;d-bugzilla&#64;moens.cc&gt;"> <span class="fn">D. Moens</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=96836" name="attach_96836" title="dmesg | egrep -i &quot;nouveau|drm&quot;">attachment 96836</a> <a href="attachment.cgi?id=96836&amp;action=edit" title="dmesg | egrep -i &quot;nouveau|drm&quot;">[details]</a></span>
dmesg | egrep -i &quot;nouveau|drm&quot;

Testing with GK106GLM [Quadro K2100M], QHD+ (3200x1800) screen.

MMIO FAULT is reproducible with kernel 3.14 &amp; darktama's git 
633e16bb8571071b9da8ed03513a2266cbf21eb5.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396519710.Afd3A7C5.27268--

--===============0846937227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0846937227==--
