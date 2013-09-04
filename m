From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49727] [nv30 gallium] wine 1.5.2 and 3Dmark2001se
 displays only black screen with FPS, on nv43/AGP
Date: Wed, 04 Sep 2013 05:49:37 +0000
Message-ID: <bug-49727-8800-VrSvc5jwfH@http.bugs.freedesktop.org/>
References: <bug-49727-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0247053451=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49727-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0247053451==
Content-Type: multipart/alternative; boundary="1378273777.5D6431.28327"; charset="us-ascii"


--1378273777.5D6431.28327
Date: Wed, 4 Sep 2013 05:49:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=49727

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Hm, I'm getting a crash with current mesa, due to memory corruption
(nv30->screen starts pointing to an illegal pointer, is_nv4x == 0x656369,
use_nv4x == 0x29). The char values turn out to look more like '.pcm.device', so
probably some use-after-free in the alsa module or just some plain corruption
in wine-1.7.0. Ugh. Below is the full list of strings I saw inside of the
objected pointed at by nv30... although even more interestingly, the stack
frame goes like

#0  0x7d550017 in nouveau_fence_next (screen=0x7daaf45c) at nouveau_fence.c:227
#1  0x7d46538e in nv30_context_kick_notify (push=0x7da660c0) at
nv30_context.c:47
#2  0x7db28aef in ?? () from /usr/lib32/libdrm_nouveau.so.2
#3  0x7db28e0c in ?? () from /usr/lib32/libdrm_nouveau.so.2
#4  0x7db29bcb in nouveau_pushbuf_kick () from /usr/lib32/libdrm_nouveau.so.2
#5  0x7d46525f in PUSH_KICK (push=0x7da660c0) at
../../../../src/gallium/drivers/nouveau/nouveau_winsys.h:56
#6  0x7d4654d1 in nv30_context_flush (pipe=0x7da5c520, fence=0x0, flags=0) at
nv30_context.c:81

And the nv30 in frame #1 is different than the nv30 in frame #6. The one in #6
is fine.

In frame #1:

$3 = (struct nv30_context *) 0x7daaf2f8

In frame #6:

$6 = (struct nv30_context *) 0x7da5c520

Which is *way* off. The nv30 in frame #6 seems completely fine. I wonder if
user_priv isn't being set correctly, or passed around correctly, or something.
(Obviously worth nothing that this is a 32-bit userspace on 64-bit kernel
situation as well.)



----

0x7df49088:     "X\263?|\003"
0x7df49090:     "h\263?|"
0x7df4909c:     "\350\262?|D\263?|\340\262?|"
0x7df490ac:     "\021"
0x7df490b0:     "modem"
0x7df490b6:     "ts"
0x7df490bc:     ")"
0x7df490c0:     "\260\220\364}"
0x7df490c5:     "\004"
0x7df490c8:     "\f\221\364}\\\221\364}\001"
0x7df490d4:     "\244\221\364}\364\262?|\020\306?|"
0x7df490e4:     "\021"
0x7df490e8:     "card"
0x7df490ed:     "\024Z\367"
0x7df490f4:     ")"
0x7df490f8:     "\350\220\364}\003"
0x7df49100:     "\200\263?|"
0x7df4910c:     "\\\221\364}\310\220\364}\300\220\364}"
0x7df4911c:     "\021"
0x7df49120:     "device"
0x7df49127:     "s"
0x7df4912c:     "\031"
0x7df49130:     "defaults.pcm.device"
0x7df49144:     ")"
0x7df49148:     " \221\364}\003"
0x7df49150:     "0\221\364}"
0x7df4915c:     "\310\220\364}\f\221\364}\300\220\364}"
0x7df4916c:     "\021"
0x7df49170:     "file_format"
0x7df4917c:     "\021"
0x7df49180:     "raw"
0x7df49184:     "P\024Z\367"
0x7df4918c:     ")"
0x7df49190:     "p\221\364}\003"
0x7df49198:     "\200\221\364}"
0x7df491a4:     "\364\221\364}\324\220\364}\020\306?|"
0x7df491b4:     "\021"
0x7df491b8:     "true"
0x7df491bd:     "lts"
0x7df491c4:     "\031"
0x7df491c8:     "file_truncate"
0x7df491dc:     ")"
0x7df491e0:     "\310\221\364}\003"
0x7df491e8:     "\270\221\364}"
0x7df491f4:     "\030\306?|\244\221\364}\020\306?|"
0x7df49204:     "\021"
0x7df49208:     "rawmidi"
0x7df49214:     ")"
0x7df49218:     "\b\222\364}"
0x7df4921d:     "\004"
0x7df49220:     "t\222\364}\344\222\364}\001"
0x7df4922c:     "\f\223\364}$\306?|\300\234-|"
0x7df4923c:     "\021"
0x7df49240:     "card"
0x7df49245:     "\024Z\367"
0x7df4924c:     "\021"
0x7df49250:     "device"
0x7df4925c:     ")"
0x7df49260:     "@\222\364}"
0x7df49274:     "\254\222\364} \222\364}\030\222\364}"
0x7df49284:     "\021"
0x7df49288:     "subdevice"
0x7df49294:     ")"
0x7df49298:     "P\222\364}"
0x7df492ac:     "\344\222\364}t\222\364}\030\222\364}"
0x7df492bc:     "\021"
0x7df492c0:     "hwdep"
0x7df492c6:     "ts"
0x7df492cc:     ")"
0x7df492d0:     "\210\222\364}"
0x7df492d8:     "\377\377\377\377"
0x7df492e4:     " \222\364}\254\222\364}\030\222\364}"
0x7df492f4:     ")"
0x7df492f8:     "\300\222\364}"
0x7df492fd:     "\004"
0x7df49300:     "T\223\364}\214\223\364}\001"
0x7df4930c:     "\264\223\364},\222\364}\300\234-|"
0x7df4931c:     "\021"
0x7df49320:     "card"
0x7df49325:     "\024Z\367"
0x7df4932c:     "\021"
0x7df49330:     "device"
0x7df49337:     "s"
0x7df4933c:     ")"
0x7df49340:     " \223\364}"
0x7df49354:     "\214\223\364}"
0x7df49359:     "\223\364}\370\222\364}"
0x7df49364:     "\021"
0x7df49368:     "timer"
0x7df4936e:     "ts"
0x7df49374:     ")"
0x7df49378:     "0\223\364}"
0x7df4938d:     "\223\364}T\223\364}\370\222\364}"
0x7df4939c:     ")"
0x7df493a0:     "h\223\364}"
0x7df493a5:     "\004"
0x7df493a8:     "\374\223\364}\334\224\364}\001"
0x7df493b4:     "\310\234-|\f\223\364}\300\234-|"
0x7df493c4:     "\021"
0x7df493c8:     "class"
0x7df493ce:     "Z\367"
0x7df493d4:     "\021"
0x7df493d8:     "sclass"
0x7df493df:     "s"
0x7df493e4:     ")"
0x7df493e8:     "\310\223\364}"
0x7df493f0:     "\002"
0x7df493fc:     "4\224\364}\250\223\364}\240\223\364}"
0x7df4940c:     "\021"
0x7df49410:     "card"
0x7df49416:     "ts"
0x7df4941c:     ")"
0x7df49420:     "\330\223\364}"
0x7df49434:     "l\224\364}\374\223\364}\240\223\364}"
0x7df49444:     "\021"
0x7df49448:     "device"
0x7df4944f:     "s"
0x7df49454:     ")"
0x7df49458:     "\020\224\364}"
0x7df4946c:     "\244\224\364}4\224\364}\240\223\364}"
0x7df4947c:     "\021"
0x7df49480:     "subdevice"
0x7df4948c:     ")"
0x7df49490:     "H\224\364}"
0x7df494a4:     "\334\224\364}l\224\364}\240\223\364}"
0x7df494b4:     "\021"
0x7df494b8:     "pcm"
0x7df494bc:     "P\024Z\367"
0x7df494c4:     ")"
0x7df494c8:     "\200\224\364}"
0x7df494dc:     "\250\223\364}\244\224\364}\240\223\364}"
0x7df494ec:     ")"
0x7df494f0:     "\270\224\364}"
0x7df494f5:     "\004"
0x7df494f8:     "L\225\364}\234\361?|\001"
0x7df49504:     "T\363?|\324\234-| \356\366}"
0x7df49514:     "\021"
0x7df49518:     "cards"
0x7df4951e:     "Z\367"
0x7df49524:     "\021"
0x7df49528:     "cards.pcm"
0x7df49534:     ")"
0x7df49538:     "\030\225\364}\003"
0x7df49540:     "(\225\364}"
0x7df4954c:     "\234\225\364}\370\224\364}\360\224\364}"
0x7df4955c:     "\021"
0x7df49560:     "default"
0x7df4956c:     "\031"
0x7df49570:     "cards.pcm.default"
0x7df49584:     ")"
0x7df49588:     "`\225\364}\003"
0x7df49590:     "p\225\364}"
0x7df4959c:     "\354\225\364}L\225\364}\360\224\364}"
0x7df495ac:     "\021"
0x7df495b0:     "sysdefault"
0x7df495bc:     "\031"
0x7df495c0:     "cards.pcm.default"
0x7df495d4:     ")"
0x7df495d8:     "\260\225\364}\003"
0x7df495e0:     "\300\225\364}"
0x7df495ec:     "<\226\364}\234\225\364}\360\224\364}"
0x7df495fc:     "\021"
0x7df49600:     "front"
0x7df49606:     "Z\367"
0x7df4960c:     "\031"
0x7df49610:     "cards.pcm.front"
0x7df49624:     ")"
0x7df49629:     "\226\364}\003"
0x7df49630:     "\020\226\364}"
0x7df4963c:     "\214\226\364}\354\225\364}\360\224\364}"
0x7df4964c:     "\021"
0x7df49650:     "rear"
0x7df49655:     "\024Z\367"
0x7df4965c:     "\031"
0x7df49660:     "cards.pcm.rear"
0x7df49674:     ")"
0x7df49678:     "P\226\364}\003"
0x7df49680:     "`\226\364}"
0x7df4968c:     "\344\226\364}<\226\364}\360\224\364}"
0x7df4969c:     "\021"
0x7df496a0:     "center_lfe"
0x7df496ac:     "!"
0x7df496b0:     "cards.pcm.center_lfe"
0x7df496cc:     ")"
0x7df496d0:     "\240\226\364}\003"
0x7df496d8:     "\260\226\364}"
0x7df496e4:     "4\227\364}\214\226\364}\360\224\364}"
0x7df496f4:     "\021"
0x7df496f8:     "side"
0x7df496fd:     "\024Z\367"
0x7df49704:     "\031"
0x7df49708:     "cards.pcm.side"
0x7df4971c:     ")"
0x7df49720:     "\370\226\364}\003"
0x7df49728:     "\b\227\364}"
0x7df49734:     "\214\227\364}\344\226\364}\360\224\364}"
0x7df49744:     "\021"
0x7df49748:     "surround40"
0x7df49754:     "!"
0x7df49758:     "cards.pcm.surround40"
0x7df49774:     ")"
0x7df49778:     "H\227\364}\003"
0x7df49780:     "X\227\364}"
0x7df4978c:     "\344\227\364}4\227\364}\360\224\364}"
0x7df4979c:     "\021"
0x7df497a0:     "surround41"
0x7df497ac:     "!"
0x7df497b0:     "cards.pcm.surround41"
0x7df497cc:     ")"
0x7df497d0:     "\240\227\364}\003"
0x7df497d8:     "\260\227\364}"
0x7df497e4:     "l50|\214\227\364}\360\224\364}"
0x7df497f4:     "\021"
0x7df497f8:     "surround50"
0x7df49804:     "!"
0x7df49808:     "cards.pcm.surround50"
0x7df49820:     "\230\034=|\021"
0x7df49828:     "surround51"
0x7df49834:     "9"
0x7df49838:     "\006\021Z"
0x7df4983c:     "\310\235\365}"
0x7df49844:     "p\230\364}\200=0|"
0x7df49850:     "\006\024"
0x7df49854:     "\a"
0x7df4985c:     "\210\230\364}\001"
0x7df49864:     "LA\203}"
0x7df4986c:     "1"
0x7df49870:     "\006\021Z"
0x7df49874:     "\310\235\365}"
0x7df4987c:     "\340\374\366}8\230\364}"
0x7df49888:     "float[1]"
0x7df4989c:     "1&"
0x7df498a0:     "\276V7}"
0x7df498a8:     "\267W7}\355W7}\250A\367}"

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378273777.5D6431.28327
Date: Wed, 4 Sep 2013 05:49:37 +0000
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
   title="NEW --- - [nv30 gallium] wine 1.5.2 and 3Dmark2001se displays only black screen with FPS, on nv43/AGP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49727#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv30 gallium] wine 1.5.2 and 3Dmark2001se displays only black screen with FPS, on nv43/AGP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49727">bug 49727</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Hm, I'm getting a crash with current mesa, due to memory corruption
(nv30-&gt;screen starts pointing to an illegal pointer, is_nv4x == 0x656369,
use_nv4x == 0x29). The char values turn out to look more like '.pcm.device', so
probably some use-after-free in the alsa module or just some plain corruption
in wine-1.7.0. Ugh. Below is the full list of strings I saw inside of the
objected pointed at by nv30... although even more interestingly, the stack
frame goes like

#0  0x7d550017 in nouveau_fence_next (screen=0x7daaf45c) at nouveau_fence.c:227
#1  0x7d46538e in nv30_context_kick_notify (push=0x7da660c0) at
nv30_context.c:47
#2  0x7db28aef in ?? () from /usr/lib32/libdrm_nouveau.so.2
#3  0x7db28e0c in ?? () from /usr/lib32/libdrm_nouveau.so.2
#4  0x7db29bcb in nouveau_pushbuf_kick () from /usr/lib32/libdrm_nouveau.so.2
#5  0x7d46525f in PUSH_KICK (push=0x7da660c0) at
../../../../src/gallium/drivers/nouveau/nouveau_winsys.h:56
#6  0x7d4654d1 in nv30_context_flush (pipe=0x7da5c520, fence=0x0, flags=0) at
nv30_context.c:81

And the nv30 in frame #1 is different than the nv30 in frame #6. The one in #6
is fine.

In frame #1:

$3 = (struct nv30_context *) 0x7daaf2f8

In frame #6:

$6 = (struct nv30_context *) 0x7da5c520

Which is *way* off. The nv30 in frame #6 seems completely fine. I wonder if
user_priv isn't being set correctly, or passed around correctly, or something.
(Obviously worth nothing that this is a 32-bit userspace on 64-bit kernel
situation as well.)



----

0x7df49088:     &quot;X\263?|\003&quot;
0x7df49090:     &quot;h\263?|&quot;
0x7df4909c:     &quot;\350\262?|D\263?|\340\262?|&quot;
0x7df490ac:     &quot;\021&quot;
0x7df490b0:     &quot;modem&quot;
0x7df490b6:     &quot;ts&quot;
0x7df490bc:     &quot;)&quot;
0x7df490c0:     &quot;\260\220\364}&quot;
0x7df490c5:     &quot;\004&quot;
0x7df490c8:     &quot;\f\221\364}\\\221\364}\001&quot;
0x7df490d4:     &quot;\244\221\364}\364\262?|\020\306?|&quot;
0x7df490e4:     &quot;\021&quot;
0x7df490e8:     &quot;card&quot;
0x7df490ed:     &quot;\024Z\367&quot;
0x7df490f4:     &quot;)&quot;
0x7df490f8:     &quot;\350\220\364}\003&quot;
0x7df49100:     &quot;\200\263?|&quot;
0x7df4910c:     &quot;\\\221\364}\310\220\364}\300\220\364}&quot;
0x7df4911c:     &quot;\021&quot;
0x7df49120:     &quot;device&quot;
0x7df49127:     &quot;s&quot;
0x7df4912c:     &quot;\031&quot;
0x7df49130:     &quot;defaults.pcm.device&quot;
0x7df49144:     &quot;)&quot;
0x7df49148:     &quot; \221\364}\003&quot;
0x7df49150:     &quot;0\221\364}&quot;
0x7df4915c:     &quot;\310\220\364}\f\221\364}\300\220\364}&quot;
0x7df4916c:     &quot;\021&quot;
0x7df49170:     &quot;file_format&quot;
0x7df4917c:     &quot;\021&quot;
0x7df49180:     &quot;raw&quot;
0x7df49184:     &quot;P\024Z\367&quot;
0x7df4918c:     &quot;)&quot;
0x7df49190:     &quot;p\221\364}\003&quot;
0x7df49198:     &quot;\200\221\364}&quot;
0x7df491a4:     &quot;\364\221\364}\324\220\364}\020\306?|&quot;
0x7df491b4:     &quot;\021&quot;
0x7df491b8:     &quot;true&quot;
0x7df491bd:     &quot;lts&quot;
0x7df491c4:     &quot;\031&quot;
0x7df491c8:     &quot;file_truncate&quot;
0x7df491dc:     &quot;)&quot;
0x7df491e0:     &quot;\310\221\364}\003&quot;
0x7df491e8:     &quot;\270\221\364}&quot;
0x7df491f4:     &quot;\030\306?|\244\221\364}\020\306?|&quot;
0x7df49204:     &quot;\021&quot;
0x7df49208:     &quot;rawmidi&quot;
0x7df49214:     &quot;)&quot;
0x7df49218:     &quot;\b\222\364}&quot;
0x7df4921d:     &quot;\004&quot;
0x7df49220:     &quot;t\222\364}\344\222\364}\001&quot;
0x7df4922c:     &quot;\f\223\364}$\306?|\300\234-|&quot;
0x7df4923c:     &quot;\021&quot;
0x7df49240:     &quot;card&quot;
0x7df49245:     &quot;\024Z\367&quot;
0x7df4924c:     &quot;\021&quot;
0x7df49250:     &quot;device&quot;
0x7df4925c:     &quot;)&quot;
0x7df49260:     &quot;&#64;\222\364}&quot;
0x7df49274:     &quot;\254\222\364} \222\364}\030\222\364}&quot;
0x7df49284:     &quot;\021&quot;
0x7df49288:     &quot;subdevice&quot;
0x7df49294:     &quot;)&quot;
0x7df49298:     &quot;P\222\364}&quot;
0x7df492ac:     &quot;\344\222\364}t\222\364}\030\222\364}&quot;
0x7df492bc:     &quot;\021&quot;
0x7df492c0:     &quot;hwdep&quot;
0x7df492c6:     &quot;ts&quot;
0x7df492cc:     &quot;)&quot;
0x7df492d0:     &quot;\210\222\364}&quot;
0x7df492d8:     &quot;\377\377\377\377&quot;
0x7df492e4:     &quot; \222\364}\254\222\364}\030\222\364}&quot;
0x7df492f4:     &quot;)&quot;
0x7df492f8:     &quot;\300\222\364}&quot;
0x7df492fd:     &quot;\004&quot;
0x7df49300:     &quot;T\223\364}\214\223\364}\001&quot;
0x7df4930c:     &quot;\264\223\364},\222\364}\300\234-|&quot;
0x7df4931c:     &quot;\021&quot;
0x7df49320:     &quot;card&quot;
0x7df49325:     &quot;\024Z\367&quot;
0x7df4932c:     &quot;\021&quot;
0x7df49330:     &quot;device&quot;
0x7df49337:     &quot;s&quot;
0x7df4933c:     &quot;)&quot;
0x7df49340:     &quot; \223\364}&quot;
0x7df49354:     &quot;\214\223\364}&quot;
0x7df49359:     &quot;\223\364}\370\222\364}&quot;
0x7df49364:     &quot;\021&quot;
0x7df49368:     &quot;timer&quot;
0x7df4936e:     &quot;ts&quot;
0x7df49374:     &quot;)&quot;
0x7df49378:     &quot;0\223\364}&quot;
0x7df4938d:     &quot;\223\364}T\223\364}\370\222\364}&quot;
0x7df4939c:     &quot;)&quot;
0x7df493a0:     &quot;h\223\364}&quot;
0x7df493a5:     &quot;\004&quot;
0x7df493a8:     &quot;\374\223\364}\334\224\364}\001&quot;
0x7df493b4:     &quot;\310\234-|\f\223\364}\300\234-|&quot;
0x7df493c4:     &quot;\021&quot;
0x7df493c8:     &quot;class&quot;
0x7df493ce:     &quot;Z\367&quot;
0x7df493d4:     &quot;\021&quot;
0x7df493d8:     &quot;sclass&quot;
0x7df493df:     &quot;s&quot;
0x7df493e4:     &quot;)&quot;
0x7df493e8:     &quot;\310\223\364}&quot;
0x7df493f0:     &quot;\002&quot;
0x7df493fc:     &quot;4\224\364}\250\223\364}\240\223\364}&quot;
0x7df4940c:     &quot;\021&quot;
0x7df49410:     &quot;card&quot;
0x7df49416:     &quot;ts&quot;
0x7df4941c:     &quot;)&quot;
0x7df49420:     &quot;\330\223\364}&quot;
0x7df49434:     &quot;l\224\364}\374\223\364}\240\223\364}&quot;
0x7df49444:     &quot;\021&quot;
0x7df49448:     &quot;device&quot;
0x7df4944f:     &quot;s&quot;
0x7df49454:     &quot;)&quot;
0x7df49458:     &quot;\020\224\364}&quot;
0x7df4946c:     &quot;\244\224\364}4\224\364}\240\223\364}&quot;
0x7df4947c:     &quot;\021&quot;
0x7df49480:     &quot;subdevice&quot;
0x7df4948c:     &quot;)&quot;
0x7df49490:     &quot;H\224\364}&quot;
0x7df494a4:     &quot;\334\224\364}l\224\364}\240\223\364}&quot;
0x7df494b4:     &quot;\021&quot;
0x7df494b8:     &quot;pcm&quot;
0x7df494bc:     &quot;P\024Z\367&quot;
0x7df494c4:     &quot;)&quot;
0x7df494c8:     &quot;\200\224\364}&quot;
0x7df494dc:     &quot;\250\223\364}\244\224\364}\240\223\364}&quot;
0x7df494ec:     &quot;)&quot;
0x7df494f0:     &quot;\270\224\364}&quot;
0x7df494f5:     &quot;\004&quot;
0x7df494f8:     &quot;L\225\364}\234\361?|\001&quot;
0x7df49504:     &quot;T\363?|\324\234-| \356\366}&quot;
0x7df49514:     &quot;\021&quot;
0x7df49518:     &quot;cards&quot;
0x7df4951e:     &quot;Z\367&quot;
0x7df49524:     &quot;\021&quot;
0x7df49528:     &quot;cards.pcm&quot;
0x7df49534:     &quot;)&quot;
0x7df49538:     &quot;\030\225\364}\003&quot;
0x7df49540:     &quot;(\225\364}&quot;
0x7df4954c:     &quot;\234\225\364}\370\224\364}\360\224\364}&quot;
0x7df4955c:     &quot;\021&quot;
0x7df49560:     &quot;default&quot;
0x7df4956c:     &quot;\031&quot;
0x7df49570:     &quot;cards.pcm.default&quot;
0x7df49584:     &quot;)&quot;
0x7df49588:     &quot;`\225\364}\003&quot;
0x7df49590:     &quot;p\225\364}&quot;
0x7df4959c:     &quot;\354\225\364}L\225\364}\360\224\364}&quot;
0x7df495ac:     &quot;\021&quot;
0x7df495b0:     &quot;sysdefault&quot;
0x7df495bc:     &quot;\031&quot;
0x7df495c0:     &quot;cards.pcm.default&quot;
0x7df495d4:     &quot;)&quot;
0x7df495d8:     &quot;\260\225\364}\003&quot;
0x7df495e0:     &quot;\300\225\364}&quot;
0x7df495ec:     &quot;&lt;\226\364}\234\225\364}\360\224\364}&quot;
0x7df495fc:     &quot;\021&quot;
0x7df49600:     &quot;front&quot;
0x7df49606:     &quot;Z\367&quot;
0x7df4960c:     &quot;\031&quot;
0x7df49610:     &quot;cards.pcm.front&quot;
0x7df49624:     &quot;)&quot;
0x7df49629:     &quot;\226\364}\003&quot;
0x7df49630:     &quot;\020\226\364}&quot;
0x7df4963c:     &quot;\214\226\364}\354\225\364}\360\224\364}&quot;
0x7df4964c:     &quot;\021&quot;
0x7df49650:     &quot;rear&quot;
0x7df49655:     &quot;\024Z\367&quot;
0x7df4965c:     &quot;\031&quot;
0x7df49660:     &quot;cards.pcm.rear&quot;
0x7df49674:     &quot;)&quot;
0x7df49678:     &quot;P\226\364}\003&quot;
0x7df49680:     &quot;`\226\364}&quot;
0x7df4968c:     &quot;\344\226\364}&lt;\226\364}\360\224\364}&quot;
0x7df4969c:     &quot;\021&quot;
0x7df496a0:     &quot;center_lfe&quot;
0x7df496ac:     &quot;!&quot;
0x7df496b0:     &quot;cards.pcm.center_lfe&quot;
0x7df496cc:     &quot;)&quot;
0x7df496d0:     &quot;\240\226\364}\003&quot;
0x7df496d8:     &quot;\260\226\364}&quot;
0x7df496e4:     &quot;4\227\364}\214\226\364}\360\224\364}&quot;
0x7df496f4:     &quot;\021&quot;
0x7df496f8:     &quot;side&quot;
0x7df496fd:     &quot;\024Z\367&quot;
0x7df49704:     &quot;\031&quot;
0x7df49708:     &quot;cards.pcm.side&quot;
0x7df4971c:     &quot;)&quot;
0x7df49720:     &quot;\370\226\364}\003&quot;
0x7df49728:     &quot;\b\227\364}&quot;
0x7df49734:     &quot;\214\227\364}\344\226\364}\360\224\364}&quot;
0x7df49744:     &quot;\021&quot;
0x7df49748:     &quot;surround40&quot;
0x7df49754:     &quot;!&quot;
0x7df49758:     &quot;cards.pcm.surround40&quot;
0x7df49774:     &quot;)&quot;
0x7df49778:     &quot;H\227\364}\003&quot;
0x7df49780:     &quot;X\227\364}&quot;
0x7df4978c:     &quot;\344\227\364}4\227\364}\360\224\364}&quot;
0x7df4979c:     &quot;\021&quot;
0x7df497a0:     &quot;surround41&quot;
0x7df497ac:     &quot;!&quot;
0x7df497b0:     &quot;cards.pcm.surround41&quot;
0x7df497cc:     &quot;)&quot;
0x7df497d0:     &quot;\240\227\364}\003&quot;
0x7df497d8:     &quot;\260\227\364}&quot;
0x7df497e4:     &quot;l50|\214\227\364}\360\224\364}&quot;
0x7df497f4:     &quot;\021&quot;
0x7df497f8:     &quot;surround50&quot;
0x7df49804:     &quot;!&quot;
0x7df49808:     &quot;cards.pcm.surround50&quot;
0x7df49820:     &quot;\230\034=|\021&quot;
0x7df49828:     &quot;surround51&quot;
0x7df49834:     &quot;9&quot;
0x7df49838:     &quot;\006\021Z&quot;
0x7df4983c:     &quot;\310\235\365}&quot;
0x7df49844:     &quot;p\230\364}\200=0|&quot;
0x7df49850:     &quot;\006\024&quot;
0x7df49854:     &quot;\a&quot;
0x7df4985c:     &quot;\210\230\364}\001&quot;
0x7df49864:     &quot;LA\203}&quot;
0x7df4986c:     &quot;1&quot;
0x7df49870:     &quot;\006\021Z&quot;
0x7df49874:     &quot;\310\235\365}&quot;
0x7df4987c:     &quot;\340\374\366}8\230\364}&quot;
0x7df49888:     &quot;float[1]&quot;
0x7df4989c:     &quot;1&amp;&quot;
0x7df498a0:     &quot;\276V7}&quot;
0x7df498a8:     &quot;\267W7}\355W7}\250A\367}&quot;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378273777.5D6431.28327--

--===============0247053451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0247053451==--
